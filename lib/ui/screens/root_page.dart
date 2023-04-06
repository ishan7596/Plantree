import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/screens/register_page.dart';
import 'package:flutter_onboarding/ui/screens/scan_page.dart';
import 'package:flutter_onboarding/ui/screens/cart_page.dart';
import 'package:flutter_onboarding/ui/screens/favorite_page.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:flutter_onboarding/ui/screens/profile_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/mySnackbar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/comman_dailog.dart';
import 'notification/notificationList.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isloading = true;

  List<Plant> favorites = [];
  List<Plant> myCart = [];

  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      FavoritePage(
        favoritedPlants: favorites,
      ),
      CartPage(
        addedToCartPlants: myCart,
      ),
      ProfilePage(),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Plantree',
    'Favorites',
    'Cart',
    'Profile',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() {
    _firestore
        .collection("Users")
        .doc(_auth.currentUser?.uid)
        .get()
        .then((value) {
      if (value.exists) {
        isloading = false;
        setState(() {});
      } else {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => RegisterPage(),), (
            route) => false);
      }
    });
  }

  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_bottomNavIndex == 0) {
          final now = DateTime.now();
          final timeDiff = lastPressed == null
              ? Duration(seconds: 10)
              : now.difference(lastPressed!);
          if (timeDiff > Duration(seconds: 2)) {
            lastPressed = now;
            showSnackbar("Exit?", "Press Back Again to Exit.",
                snackPosition: SnackPosition.BOTTOM);
            return false;
          }
          return true;
        } else {
          _bottomNavIndex = 0;
          setState(() {

          });
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleList[_bottomNavIndex],
                style: GoogleFonts.montserrat(
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationList()),
                  );
                },
                icon: Icon(Icons.notifications),
                color: Colors.green.shade900,
              )
            ],
          ),
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
          elevation: 0.0,
        ),
        body: isloading ? Center(
          child: CircularProgressIndicator(),
        ) : IndexedStack(
          index: _bottomNavIndex,
          children: _widgetOptions(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const ScanPage(),
                    type: PageTransitionType.bottomToTop));
          },
          child: Image.asset(
            'assets/images/code-scan-two.png',
            height: 30.0,
          ),
          backgroundColor: Colors.green.shade900,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
            splashColor: Constants.primaryColor,
            activeColor: Constants.primaryColor,
            inactiveColor: Colors.black.withOpacity(.5),
            icons: iconList,
            activeIndex: _bottomNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            onTap: (index) {
              setState(() {
                _bottomNavIndex = index;
                final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
                final List<Plant> addedToCartPlants = Plant.addedToCartPlants();

                favorites = favoritedPlants;
                myCart = addedToCartPlants.toSet().toList();
              });
            }),
      ),
    );
  }
}
