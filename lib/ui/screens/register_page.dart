import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding/models/user_model.dart';
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

  // late String _firstName, _middleName, _lastName, _dob, _email, _mobile;
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();

  // TextEditingController gender = TextEditingController();
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
    // TODO: implement initState
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              // CircleAvatar(
                              //     backgroundImage:
                              //         AssetImage("assets/images/12345.jpg"),
                              //     maxRadius: 50,
                              //     child: imageFile == null
                              //         ? InkWell(
                              //             borderRadius: BorderRadius.circular(50),
                              //             onTap: () async {
                              //               await pickImageFromGallery();
                              //             },
                              //           )
                              //         : CircleAvatar(
                              //             backgroundImage: FileImage(imageFile!),
                              //             maxRadius: 50,
                              //           )),
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
                                // onSaved: (value) => _firstName = value!,
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
                                // onSaved: (value) => _lastName = value!,
                              ),
                              DropdownButtonFormField(
                                // elevation: 100,
                                dropdownColor: Colors.white70,

                                borderRadius: BorderRadius.circular(30),
                                style: GoogleFonts.montserrat(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                  label: Text(
                                    "Gender",
                                  ),
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
                                decoration: const InputDecoration(
                                  labelText: "Birth Date",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter your Birthdate";
                                  }
                                  return null;
                                },
                                // onSaved: (value) => _email = value!,
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
                                decoration: const InputDecoration(
                                    labelText: "Mobile No."),
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
                                decoration:
                                    const InputDecoration(labelText: "Email"),
                              ),
                              // TextFormField(
                              //   autovalidateMode: AutovalidateMode.onUserInteraction,
                              //   validator: (value) {
                              //     if (value == null || value.isEmpty) {
                              //       return 'Please enter some text';
                              //     } else if (value.length < 8) {
                              //       return 'Please Enter Minimum 8 character!!';
                              //     } else {
                              //       return null;
                              //     }
                              //   },
                              //   keyboardType: TextInputType.text,
                              //   obscureText: !passwordVisiblee,
                              //   style: GoogleFonts.montserrat(
                              //       color: Colors.black54,
                              //       fontSize: 20,
                              //       letterSpacing: 0.5,
                              //       fontWeight: FontWeight.bold),
                              //   decoration: InputDecoration(
                              //     labelText: "Enter Password",
                              //     suffixIcon: IconButton(
                              //       icon: Icon(
                              //         passwordVisiblee
                              //             ? Icons.visibility
                              //             : Icons.visibility_off,
                              //         color: Colors.black54,
                              //       ),
                              //       onPressed: () {
                              //         setState(() {
                              //           passwordVisiblee = !passwordVisiblee;
                              //         });
                              //       },
                              //     ),
                              //   ),
                              // ),
                              // TextFormField(
                              //   autovalidateMode: AutovalidateMode.onUserInteraction,
                              //   validator: (value) {
                              //     if (value == null || value.isEmpty) {
                              //       return 'Please enter some text';
                              //     } else if (value.length < 8) {
                              //       return 'Please Enter Minimum 8 character!!';
                              //     } else {
                              //       return null;
                              //     }
                              //   },
                              //   keyboardType: TextInputType.text,
                              //   obscureText: !passwordVisible,
                              //   style: GoogleFonts.montserrat(
                              //       color: Colors.black54,
                              //       fontSize: 20,
                              //       letterSpacing: 0.5,
                              //       fontWeight: FontWeight.bold),
                              //   decoration: InputDecoration(
                              //     labelText: "Confirm Password",
                              //     suffixIcon: IconButton(
                              //       icon: Icon(
                              //         passwordVisible
                              //             ? Icons.visibility
                              //             : Icons.visibility_off,
                              //         color: Colors.black54,
                              //       ),
                              //       onPressed: () {
                              //         setState(() {
                              //           passwordVisible = !passwordVisible;
                              //         });
                              //       },
                              //     ),
                              //   ),
                              // ),
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
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => RootPage(),
                                    //   ),
                                    // ),
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
                                        Reference ref = FirebaseStorage.instance
                                            .ref()
                                            .child(
                                                "${FirebaseAuth.instance.currentUser?.uid}");
                                        ref.putFile(imageFile!).then((p0) {
                                          debugPrint("image uploaded");
                                          Navigator.pop(context);
                                        });
                                      } else {
                                        Navigator.pop(context);
                                      }

                                      // Navigator.pushAndRemoveUntil(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => RootPage(),
                                      //     ),
                                      //     (route) => false);
                                    });
                                    // Navigator.pop(context);
                                    // SharedPreferences pref =
                                    //     await SharedPreferences.getInstance();

                                    // String a = json.encode(profile);
                                    // pref.setString("profile", a);
                                  }
                                },
                                splashColor: Colors.white30,
                                child: Text(
                                  "Register ",
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
