import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/root_page.dart';
import 'package:flutter_onboarding/ui/forgot_password.dart';
import 'package:flutter_onboarding/ui/SignUp.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../models/constants.dart';
import '../models/auth_controller.dart';

class SignIn extends StatefulWidget {

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController(text: "ishan@gmail.com");
  // final nameController = TextEditingController();
  final passwordController = TextEditingController(text: "12345678");
  Map<String, String> userLoginData = {"email": "", "password": ""};
  bool passwordVisiblee = false;
  AuthController controller = Get.put(AuthController());
  FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  login() async {
    if (_formKey.currentState!.validate()) {
      print("Form is valid ");
      _formKey.currentState!.save();
      print('Data for login $userLoginData');
      controller.login(userLoginData["email"], userLoginData["password"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/signin.png'),
              Text(
                'Sign In',
                style: GoogleFonts.montserrat(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              // const CustomTextfield(
              //   obscureText: false,
              //   hintText: 'Enter Email',
              //
              //   icon: Icons.alternate_email,
              // ),
              Form(
                key: _formKey,
                child: Column(
                  children: [

                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
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
                        }
                        // else if (RegExp(
                        //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //     .hasMatch(value) ==
                        //     false) {
                        //   return 'Password should contain upper,lower,digit and Special character';
                        // }
                        else {
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
              //   obscureText: true,
              //   hintText: 'Enter Password',
              //   icon: Icons.lock,
              // ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: login,
                //     () {
                //   Navigator.pushReplacement(
                //       context,
                //       PageTransition(
                //           child: const RootPage(),
                //           type: PageTransitionType.bottomToTop));
                // },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child:  Center(
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: const ForgotPassword(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'Forgot Password?',
                          style: TextStyle(
                            color: Constants.blackColor,
                          ),
                        ),
                        // TextSpan(
                        //   text: 'Reset Here',
                        //   style: TextStyle(
                        //     color: Constants.primaryColor,
                        //   ),
                        // ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: const SignUp(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Center(
                      child: Text.rich(

                        TextSpan(children: [
                          // TextSpan(
                          //   text: 'New to App? ',
                          //   style: GoogleFonts.montserrat(
                          //       color: Constants.blackColor,
                          //       fontWeight: FontWeight.w500),
                          // ),
                          TextSpan(
                            text: 'Sign Up',

                            style: GoogleFonts.montserrat(
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 0,
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
              //   height: 10,
              // ),
              // Container(
              //   width: size.width,
              //   decoration: BoxDecoration(
              //       border: Border.all(color: Constants.primaryColor),
              //       borderRadius: BorderRadius.circular(10)),
              //   padding:
              //   const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       SizedBox(
              //         height: 30,
              //         child: Image.asset('assets/images/google.png'),
              //       ),
              //       SizedBox(width: 15,),
              //       Text(
              //         'Sign In with Google',
              //         style: GoogleFonts.montserrat(
              //           color: Constants.blackColor,
              //           fontSize: 18.0,
              //           fontWeight: FontWeight.w600
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height:10,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
