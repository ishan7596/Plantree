//
// import 'package:flutter/material.dart';
// import 'package:flutter_onboarding/models/constants.dart';
// import 'package:google_fonts/google_fonts.dart';
// class CustomTextfield extends StatelessWidget {
//   final IconData icon;
//   final bool obscureText;
//   final String hintText;
//
//   const CustomTextfield({
//     Key? key, required this.icon, required this.obscureText, required this.hintText,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       obscureText: obscureText,
//       style: GoogleFonts.montserrat(
//         color: Constants.blackColor,
//         fontSize: 20,
//       ),
//       decoration: InputDecoration(
//
//         border: InputBorder.none,
//         prefixIcon: Icon(icon, color: Constants.blackColor.withOpacity(.3),),
//         hintText: hintText,
//       ),
//       cursorColor: Constants.blackColor.withOpacity(.5),
//     );
//   }
// }