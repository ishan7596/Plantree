// import 'package:flutter/material.dart';
// import 'package:flutter_onboarding/ui/screens/payment/payment_details.dart';
// import 'package:flutter_onboarding/ui/screens/settings/setting.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../constant.dart';
// import 'about/about.dart';
// import 'callCenter/callCenter.dart';
// import 'message/message.dart';
// import 'notification/components/defaultAppBar.dart';
// import 'notification/components/defaultBackButton.dart';
// import 'notification/notificationList.dart';
// import 'orders/trackOrder.dart';
//
// class Account extends StatefulWidget {
//   Account({Key? key}) : super(key: key);
//
//   @override
//   _AccountState createState() => _AccountState();
// }
//
// class _AccountState extends State<Account> {
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DefaultAppBar(
//         title: "Payment Details",
//         child: DefaultBackButton(),
//       ),
//       // key: scaffoldKey,
//       // backgroundColor: kWhiteColor,
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Container(height: 500,width: 500,child: Image.asset("assets/images/plant-two.png")),
//             SizedBox(height: 30,),
//             Expanded(
//               child: ListView.builder(
//                 // padding: EdgeInsets.only(top: 88.0),
//                 itemCount: labels.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                       // dense: true,
//                       leading: Icon(
//                         icons[index],
//                         color: Colors.green.shade900,
//                       ),
//                       title: Text(
//                         labels[index],
//                         style: GoogleFonts.montserrat(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                          color: Colors.green.shade900
//                         ),
//                       ),
//                       onTap: () => Navigator.of(context)
//                               .push(MaterialPageRoute(builder: (context) {
//                             switch (labels[index]) {
//                               case 'Payments':
//                                 return PaymentDetails();
//                                 break;
//
//                               case 'My Orders':
//                                 return TrackOrder();
//                                 break;
//
//                               default:
//                                 return Container(
//                                   color: Colors.red,
//                                 );
//                             }
//                           }))
//                       // onTap: () => this.setState(
//                       //   () {
//                       //     switch (labels[index]) {
//                       //       case 'Notifications':
//                       //         return snackBarMsg(context, 'Notifications');
//                       //         break;
//                       //       case 'Payments':
//                       //         return snackBarMsg(context, 'Payments');
//                       //         break;
//                       //       case 'Message':
//                       //         return snackBarMsg(context, 'Message');
//                       //         break;
//                       //       case 'My Orders':
//                       //         return snackBarMsg(context, 'My Orders');
//                       //         break;
//                       //       case 'Setting Account':
//                       //         return snackBarMsg(context, 'Setting Account');
//                       //         break;
//                       //       case 'Call Center':
//                       //         return snackBarMsg(context, 'Call Center');
//                       //         break;
//                       //       case 'About Application':
//                       //         return snackBarMsg(context, 'About Application');
//                       //         break;
//                       //       default:
//                       //         return snackBarMsg(context, 'Notifications');
//                       //         break;
//                       //     }
//                       //   },
//                       // ),
//                       );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }
