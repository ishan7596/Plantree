import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding/models/constants.dart';
import 'package:flutter_onboarding/ui/screens/widgets/custom_textfield.dart';
import 'package:flutter_onboarding/ui/screens/widgets/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'SignIn.dart';

class ForgotPassword extends StatefulWidget {
  final bool loading;

  const ForgotPassword({Key? key, this.loading = false}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool loading = false;
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void forgot() {
    setState(() {
      loading = true;
    });
    _auth
        .sendPasswordResetEmail(email: emailController.text.toString())
        .then((value) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SignIn(),
      ));
      Utils().toastMessage('please check your email to recover yuor email');

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/reset-password.png'),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Forgot\nPassword',
                  style: GoogleFonts.montserrat(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: formkey,
                  child: TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 20,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: "Enter Email",
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
                    // onSaved: (value) {
                    //   userLoginData['email'] = value!;
                    // },
                  ),
                ),
                // const CustomTextfield(
                //   obscureText: false,
                //   hintText: 'Enter Email',
                //   icon: Icons.alternate_email,
                // ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      forgot();
                    }
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Center(
                      child: Text(
                        'Reset Password',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: 'Login',
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
          ),
        ),
      ),
    );
  }
}
