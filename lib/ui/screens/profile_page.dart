import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/user_model.dart';
import 'package:flutter_onboarding/ui/SignIn.dart';
import 'package:flutter_onboarding/ui/screens/about/about.dart';
import 'package:flutter_onboarding/ui/screens/callCenter/callCenter.dart';
import 'package:flutter_onboarding/ui/screens/register_page.dart';
import 'package:flutter_onboarding/ui/screens/report/report.dart';
import 'package:flutter_onboarding/ui/screens/widgets/profile_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant.dart';
import 'notification/notificationList.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // late Map uData  ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? a = pref.getString("profile");
    // if(a != null){
    //   uData = json.decode(a);
    // }else{
    //   // uData =  {"fName": "" , "lName" :lName.text, "gender" :gender.text,"bDate" :bDate.text,"mNo" :mNo.text,"email" :email.text, };
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(16),
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: _fireStore
                .collection("Users")
                .doc(_auth.currentUser?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Something went Wrong!!",
                    style: GoogleFonts.montserrat(
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.data?.data() != null) {
                  UserModel user = UserModel.fromJson(snapshot.data!.data()!);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.grey,
                                  spreadRadius: 2,
                                  offset: Offset(0, 4))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/12345.jpg"),
                                fit: BoxFit.cover)),
                        child: ClipOval(
                          // child: Image.network(
                          //   "https://firebasestorage.googleapis.com/v0/b/plant-shopp.appspot.com/o/${FirebaseAuth.instance.currentUser?.uid}?alt=media&token=c47bb6e6-74ee-4042-86ac-9f182f96698e",
                          //   fit: BoxFit.cover,
                          //   errorBuilder: (context, error, stackTrace) {
                          //     return Image.asset(
                          //       "assets/images/12345.jpg",
                          //       fit: BoxFit.cover,
                          //     );
                          //   },
                          //   loadingBuilder: (context, child, loadingProgress) {
                          //     return Center(child: CircularProgressIndicator());
                          //   },
                          // ),

                          child: Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/plant-shopp.appspot.com/o/${FirebaseAuth.instance.currentUser?.uid}?alt=media&token=c47bb6e6-74ee-4042-86ac-9f182f96698e",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/images/12345.jpg",
                                fit: BoxFit.cover,
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if(loadingProgress == null){
                                return child;
                              }else{
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${user.fName} ${user.lName}",
                            style: GoogleFonts.montserrat(
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                              height: 24,
                              child: Image.asset("assets/images/verified.png")),
                        ],
                      ),
                      Text(
                        user.email,
                        style: GoogleFonts.montserrat(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user.mNo,
                        style: GoogleFonts.montserrat(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProfileWidget(
                            icon: Icons.person,
                            title: 'My Profile',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterPage(cUser: user)));
                            },
                          ),
                          // ProfileWidget(
                          //   icon: Icons.payment,
                          //   title: 'Payments',
                          //   onTap: () {
                          //     Navigator.of(context).push(
                          //         MaterialPageRoute(builder: (context) => Payment()));
                          //   },
                          // ),
                          // ProfileWidget(
                          //   icon: Icons.local_mall,
                          //   title: 'Track Order',
                          //   onTap: () {
                          //     Navigator.of(context).push(
                          //         MaterialPageRoute(builder: (context) => TrackOrder()));
                          //   },
                          // ),
                          ProfileWidget(
                            icon: Icons.notifications,
                            title: 'Notifications',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => NotificationList()));
                            },
                          ),

                          // ProfileWidget(
                          //   icon: Icons.chat,
                          //   title: 'Message',
                          //   onTap: () {
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) => Message()));
                          //   },
                          // ),
                          // ProfileWidget(
                          //   icon: Icons.local_dining,
                          //   title: 'My Orders',
                          //   onTap:() {
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) => TrackOrder()));
                          //   } ,
                          // ),
                          ProfileWidget(
                            icon: Icons.wifi_calling_rounded,
                            title: 'Call Center',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CallCenter()));
                            },
                          ),
                          ProfileWidget(
                            icon: Icons.announcement,
                            title: 'Report',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Report()));
                            },
                          ),
                          ProfileWidget(
                            icon: Icons.info,
                            title: 'About',
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => About()));
                            },
                          ),

                          ProfileWidget(
                            onTap: () async {
                              signOutDrawer(context);
                              // var a = await SharedPreferences.getInstance();
                              // a.setBool("login", false);
                              // FirebaseAuth.instance.signOut();
                              // Navigator.of(context).pushAndRemoveUntil(
                              //     MaterialPageRoute(builder: (context) => SignIn()),
                              //     (route) => false);
                            },
                            icon: Icons.logout,
                            title: 'Log Out',
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text(
                      "No User Found!!",
                      style: GoogleFonts.montserrat(
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  );
                }
              }
            }),
      ),
    ));
  }

  void signOutDrawer(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (context) {
          return Container(
            color: Colors.green.shade900,
            height: 130.0,
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Are you sure you want Logout ?',
                  style: GoogleFonts.montserrat(
                    color: kWhiteColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: kWhiteColor,
                        child: Text(
                          'Logout',
                          style: GoogleFonts.montserrat(
                            color: Colors.green.shade900,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () async {
                          var a = await SharedPreferences.getInstance();
                          a.setBool("login", false);
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => SignIn()),
                              (route) => false);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: MaterialButton(
                        color: Colors.green.shade100,
                        // highlightedBorderColor: kWhiteColor,
                        // borderSide: BorderSide(color: kWhiteColor),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.montserrat(
                            color: Colors.black54,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
