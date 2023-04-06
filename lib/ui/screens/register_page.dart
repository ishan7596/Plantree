import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding/models/user_model.dart';
import 'package:flutter_onboarding/ui/screens/root_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/mySnackbar.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  final UserModel? cUser;

  const RegisterPage({
    Key? key,
    this.cUser,
  }) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController bDate = TextEditingController();
  TextEditingController mNo = TextEditingController();
  String? _selectedGender;
  bool passwordVisible = false;
  bool passwordVisiblee = false;

  final List<DropdownMenuItem<String>> _dropDownMenuItems = [
    DropdownMenuItem(
      value: "Male",
      child: Text("Male",
          style: GoogleFonts.montserrat(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    ),
    DropdownMenuItem(
      value: "Female",
      child: Text("Female",
          style: GoogleFonts.montserrat(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    ),
    DropdownMenuItem(
      value: "Other",
      child: Text("Other",
          style: GoogleFonts.montserrat(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    ),
  ];
  File? imageFile;
  bool isLoading = false;
  var picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    email.text = _auth.currentUser?.email ?? "";
    if (widget.cUser != null) {
      fName.text = widget.cUser!.fName;
      lName.text = widget.cUser!.lName!;
      _selectedGender = widget.cUser!.gender!;
      bDate.text = widget.cUser!.bDate!;
      mNo.text = widget.cUser!.mNo;
    }
  }

  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(widget.cUser==null){
          final now = DateTime.now();
          final timeDiff = lastPressed == null
              ? Duration(seconds: 10)
              : now.difference(lastPressed!);
          if (timeDiff > Duration(seconds: 2)) {
            lastPressed = now;
            showSnackbar("Exit?", "Press Back Again to Exit.",
                snackPosition: SnackPosition.BOTTOM);
            return false;
          } else {
            return true;
          }
        }else{
          return true;
        }
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.7,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/plant.jpg")),
          ),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                InkWell(
                                  onTap: () async {
                                    await pickImageFromGallery();
                                  },
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 5,
                                              color: Colors.grey,
                                              spreadRadius: 2,
                                              offset: Offset(0, 4))
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/12345.jpg"),
                                            fit: BoxFit.cover)),
                                    child: ClipOval(
                                      child: imageFile != null
                                          ? Image.file(
                                              imageFile!,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              "https://firebasestorage.googleapis.com/v0/b/plant-shopp.appspot.com/o/${FirebaseAuth.instance.currentUser?.uid}?alt=media&token=c47bb6e6-74ee-4042-86ac-9f182f96698e",
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  "assets/images/12345.jpg",
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                } else {
                                                  return const CircularProgressIndicator();
                                                }
                                              },
                                            ),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: fName,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    labelText: "First Name",
                                    labelStyle: GoogleFonts.montserrat(
                                        color: Colors.green.shade900,
                                        fontSize: 17,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your first name";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: lName,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    labelText: "Last Name",
                                    labelStyle: GoogleFonts.montserrat(
                                        color: Colors.green.shade900,
                                        fontSize: 17,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your last name";
                                    }
                                    return null;
                                  },
                                ),
                                DropdownButtonFormField(
                                  dropdownColor: Colors.white70,
                                  borderRadius: BorderRadius.circular(30),
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    labelText: "Gender",
                                    labelStyle: GoogleFonts.montserrat(
                                        color: Colors.green.shade900,
                                        fontSize: 17,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  value: _selectedGender,
                                  items: _dropDownMenuItems,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value! as String?;
                                    });
                                  },
                                ),
                                TextFormField(
                                  controller: bDate,
                                  readOnly: true,
                                  onTap: () {
                                    _openDatePicker();
                                  },
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    labelText: "Birth Date",
                                    labelStyle: GoogleFonts.montserrat(
                                        color: Colors.green.shade900,
                                        fontSize: 17,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your Birthdate";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: mNo,
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    labelText: "Mobile No.",
                                    labelStyle: GoogleFonts.montserrat(
                                        color: Colors.green.shade900,
                                        fontSize: 17,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  validator: (value) {
                                    if (value!.length != 10) {
                                      return "Please enter your valid mobile number";
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  readOnly: true,
                                  controller: email,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: GoogleFonts.montserrat(
                                        color: Colors.green.shade900,
                                        fontSize: 17,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                const SizedBox(height: 70),
                                MaterialButton(
                                  height: 50.0,
                                  minWidth: 150.0,
                                  color: Colors.green.shade900,
                                  textColor: Colors.white,
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      UserModel profile = UserModel(
                                          fName: fName.text,
                                          mNo: mNo.text,
                                          email: email.text,
                                          bDate: bDate.text,
                                          gender: _selectedGender,
                                          lName: lName.text);
                                      _fireStore
                                          .collection("Users")
                                          .doc(_auth.currentUser?.uid)
                                          .set(profile.toJson())
                                          .then((value) {
                                        if (imageFile != null) {
                                          Reference ref = FirebaseStorage
                                              .instance
                                              .ref()
                                              .child(
                                                  "${FirebaseAuth.instance.currentUser?.uid}");
                                          ref.putFile(imageFile!).then((p0) {
                                            debugPrint("image uploaded");
                                            if (widget.cUser != null) {
                                              Navigator.pop(context);
                                            } else {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              RootPage()),
                                                      (route) => false);
                                            }
                                          });
                                        } else {
                                          if (widget.cUser != null) {
                                            Navigator.pop(context);
                                          } else {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            RootPage()),
                                                    (route) => false);
                                          }
                                        }
                                      });
                                    }
                                  },
                                  splashColor: Colors.white30,
                                  child: Text(
                                    "Save Details",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  pickImageFromGallery() async {
    var pickFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
    if (pickFile != null) {
      setState(() {
        imageFile = File(pickFile.path);
      });
    }
  }

  void _openDatePicker() async {
    final DateFormat now = DateFormat('dd/MM/yyyy');
    var d = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    setState(() {
      bDate.text = now.format(d!);
    });
  }
}
