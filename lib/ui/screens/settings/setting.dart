//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../constant.dart';
// import '../../SignIn.dart';
// import '../notification/components/defaultAppBar.dart';
// import '../notification/components/defaultBackButton.dart';
//
// class Setting extends StatefulWidget {
//   Setting({Key? key}) : super(key: key);
//
//   @override
//   _SettingState createState() => _SettingState();
// }
//
// class _SettingState extends State<Setting> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: kWhiteColor,
//       appBar: DefaultAppBar(
//         title: 'Setting Account',
//         child: DefaultBackButton(),
//       ),
//       body: ListView.separated(
//         padding: EdgeInsets.zero,
//         itemCount: settingLabel.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(
//               settingLabel[index],
//               style: GoogleFonts.montserrat(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 16.0,
//                 color:
//                     index % 4 == 0 ? Colors.green.shade900 : kDarkColor.withOpacity(0.6),
//               ),
//             ),
//             trailing: Icon(
//               Icons.arrow_forward_ios,
//               size: 20.0,
//               color: index % 4 == 0 ? Colors.green.shade900 : kDarkColor.withOpacity(0.6),
//             ),
//             enabled: settingLabel[index] == 'Account' ||
//                     settingLabel[index] == 'Setting'
//                 ? false
//                 : true,
//             onTap: () => this.setState(() {
//               switch (settingLabel[index]) {
//                 case 'Address':
//                   return showSnackbar("", 'Address');
//                   break;
//                 case 'Telephone':
//                   return snackBarMsg(context, 'Telephone');
//                   break;
//                 case 'Email':
//                   return snackBarMsg(context, 'Email');
//                   break;
//                 case 'Order Notifications':
//                   return snackBarMsg(context, 'Order Notifications');
//                   break;
//                 case 'Discount Notifications':
//                   return snackBarMsg(context, 'Discount Notifications');
//                   break;
//                 case 'Credit Card':
//                   return snackBarMsg(context, 'Credit Card');
//                   break;
//                 case 'Logout':
//                   return signOutDrawer(context);
//                   break;
//               }
//             }),
//           );
//         },
//         separatorBuilder: (context, index) {
//           return settingLabel[index] == 'Email' ||
//                   settingLabel[index] == 'Credit Card'
//               ? kSmallDivider
//               : Divider();
//         },
//       ),
//     );
//   }
//
//
// }
//
// void signOutDrawer(BuildContext context) {
//   showModalBottomSheet(
//       isDismissible: false,
//       context: context,
//       builder: (context) {
//         return Container(
//           color: Colors.green.shade900,
//           height: 150.0,
//           padding: EdgeInsets.symmetric(horizontal: 32.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Text(
//                 'Are you sure you want Logout ?',
//                 style: GoogleFonts.montserrat(
//                   color: kWhiteColor,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: MaterialButton(
//                       color: kWhiteColor,
//                       child: Text(
//                         'Logout',
//                         style: GoogleFonts.montserrat(
//                           color: Colors.green.shade900,
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       onPressed: () async {
//                         var a = await SharedPreferences.getInstance();
//                         a.setBool("login", false);
//                         FirebaseAuth.instance.signOut();
//                         Navigator.of(context).pushAndRemoveUntil(
//                             MaterialPageRoute(builder: (context) => SignIn()), (
//                             route) => false);
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20.0,
//                   ),
//                   Expanded(
//                     child: MaterialButton(
//                       color: Colors.green.shade100,
//                       // highlightedBorderColor: kWhiteColor,
//                       // borderSide: BorderSide(color: kWhiteColor),
//                       child: Text(
//                         'Cancel',
//                         style: GoogleFonts.montserrat(
//                           color: Colors.black54,
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       onPressed: () => Navigator.of(context).pop(),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       });
// }
