import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/widgets/size_config.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../models/constants.dart';
import '../models/auth_controller.dart';
import 'SignIn.dart';
import 'screens/widgets/utils.dart';
import 'screens/widgets/bottomcontainer.dart';
import 'screens/widgets/custom_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  // Map<String, String> userSignupData = {
  //   "username": "",
  //   "email": "",
  //   "password": "",
  //
  // };
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();


  // final passwordController  = TextEditingController();
  final emailfocusnode = FocusNode();
  final passwordfocusnode = FocusNode();
  bool loading = false;
  Map<String, String> userLoginData = {"email": "", "password": ""};

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void signup() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SignIn(),
      ));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  bool passwordVisiblee = false;
  AuthController controller = Get.find();

  DateTime date = DateTime.now();
  TextEditingController bDate = TextEditingController();

  // signUp() {
  //   if (_formKey.currentState!.validate()) {
  //     print("Form is valid ");
  //     _formKey.currentState!.save();
  //     print('User Sign Up Data $userSignupData');
  //     controller.signUp(userSignupData["email"], userSignupData["password"],
  //         );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/signup.png'),
              Text(
                'Sign Up',
                style: GoogleFonts.montserrat(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              // TextFormField(
              //   controller: emailController,
              //   keyboardType: TextInputType.text,
              //   style: GoogleFonts.montserrat(
              //       color: Colors.black54,
              //       fontSize: 20,
              //       letterSpacing: 0.5,
              //       fontWeight: FontWeight.bold),
              //   decoration: InputDecoration(
              //     labelText: 'User Name',
              //     labelStyle: GoogleFonts.montserrat(
              //         color: Colors.green.shade900,
              //         fontSize: 17,
              //         letterSpacing: 0.5,
              //         fontWeight: FontWeight.w800),
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'User Name Required';
              //     }
              //     return null;
              //   },
              //   onSaved: (value) {
              //     userLoginData['username'] = value!;
              //   },
              // ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // TextFormField(
                    //   controller: nameController,
                    //   autovalidateMode: AutovalidateMode.onUserInteraction,
                    //   style: GoogleFonts.montserrat(
                    //       color: Colors.black54,
                    //       fontSize: 20,
                    //       letterSpacing: 0.5,
                    //       fontWeight: FontWeight.bold),
                    //   decoration: InputDecoration(
                    //     labelText: "Name",
                    //     labelStyle: GoogleFonts.montserrat(
                    //         color: Colors.green.shade900,
                    //         fontSize: 17,
                    //         letterSpacing: 0.5,
                    //         fontWeight: FontWeight.w800),
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Name Required!!';
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    //   // onSaved: (value) {
                    //   //   userLoginData['email'] = value!;
                    //   // },
                    // ),
                    TextFormField(
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'E-Mail Required!!';
                        } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value) ==
                            false) {
                          return 'Please enter Valid E-mail!!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        userLoginData['email'] = value!;
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Required!!';
                        } else if (value.length < 8) {
                          return 'Please Enter Minimum 8 character!!';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      obscureText: !passwordVisiblee,
                      style: GoogleFonts.montserrat(
                          color: Colors.black54,
                          fontSize: 20,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: GoogleFonts.montserrat(
                            color: Colors.green.shade900,
                            fontSize: 17,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w800),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisiblee
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisiblee = !passwordVisiblee;
                            });
                          },
                        ),
                      ),
                      onSaved: (value) {
                        userLoginData['password'] = value!;
                      },
                    ),
                  ],
                ),
              ),

              // const CustomTextfield(
              //   obscureText: false,
              //   hintText: 'Enter Email',
              //   icon: Icons.alternate_email,
              // ),
              // const CustomTextfield(
              //   obscureText: false,
              //   hintText: 'Enter Full name',
              //   icon: Icons.person,
              // ),
              // const CustomTextfield(
              //   obscureText: true,
              //   hintText: 'Enter Password',
              //   icon: Icons.lock,
              // ),
              const SizedBox(
                height: 20,
              ),
              // BottomContainer(
              //   title: 'Sign Up',
              //   loading: loading,
              //   onTap: () {
              //     if (formkey.currentState!.validate()) {
              //       signup();
              //     }
              //   },
              //   subtitle: 'Log IN',
              //   account: 'Already have an account?',
              // ),
              // MaterialButton(
              //   onPressed: () {
              //     if (formkey.currentState!.validate()) {
              //       signup();
              //     }
              //   },
              //   child: Text("Sign Up"),
              // ),
              GestureDetector(
                onTap: signup,
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child:  Center(
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Row(
              //   children: const [
              //     Expanded(child: Divider()),
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 10),
              //       child: Text('OR'),
              //     ),
              //     Expanded(child: Divider()),
              //   ],
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   width: size.width,
              //   decoration: BoxDecoration(
              //       border: Border.all(color: Constants.primaryColor),
              //       borderRadius: BorderRadius.circular(10)),
              //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       SizedBox(
              //         height: 30,
              //         child: Image.asset('assets/images/google.png'),
              //       ),
              //       Text(
              //         'Sign Up with Google',
              //         style: TextStyle(
              //           color: Constants.blackColor,
              //           fontSize: 18.0,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: SignIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Have an Account? ',
                        style: GoogleFonts.montserrat(
                            color: Constants.blackColor,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: GoogleFonts.montserrat(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
