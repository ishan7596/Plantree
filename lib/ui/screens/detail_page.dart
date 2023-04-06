import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:flutter_onboarding/ui/screens/payment/payment.dart';
import 'package:flutter_onboarding/ui/screens/root_page.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final int plantId;

  const DetailPage({
    Key? key,
    required this.plantId,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  //Toggle add remove from cart
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 450.0,
                // backgroundColor: Colors.white,

                pinned: false,

                leading: SizedBox(),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  //collapseMode: CollapseMode.pin,
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      Constants.primaryColor.withOpacity(.15),
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Constants.primaryColor,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                debugPrint('favorite');
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color:
                                      Constants.primaryColor.withOpacity(.15),
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        bool isFavorited = toggleIsFavorated(
                                            _plantList[widget.plantId]
                                                .isFavorated);
                                        _plantList[widget.plantId].isFavorated =
                                            isFavorited;
                                      });
                                    },
                                    icon: Icon(
                                      _plantList[widget.plantId].isFavorated ==
                                              true
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Constants.primaryColor,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 50,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                              color: Colors.green.shade300.withOpacity(0.3),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                  transitionOnUserGestures: true,
                                  tag:
                                      "plant${_plantList[widget.plantId].imageURL}",
                                  child: Image.asset(
                                    _plantList[widget.plantId].imageURL,
                                    height: 370,
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  PlantFeature(
                                    title: 'Size',
                                    plantFeature:
                                        _plantList[widget.plantId].size,
                                  ),
                                  SizedBox(height: 15),
                                  PlantFeature(
                                    title: 'Humidity',
                                    plantFeature: _plantList[widget.plantId]
                                        .humidity
                                        .toString(),
                                  ),
                                  SizedBox(height: 15),
                                  PlantFeature(
                                    title: 'Temperature',
                                    plantFeature:
                                        _plantList[widget.plantId].temperature,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container(
            padding: EdgeInsets.only(bottom: 10, right: 20, left: 20, top: 5),
            color: Colors.green.shade300.withOpacity(0.3),
            child: SingleChildScrollView(
              child: Theme(
                data: ThemeData(
                  dividerColor: Colors.transparent,
                  unselectedWidgetColor: Colors.green.shade900,
                  textTheme: TextTheme(
                    subtitle1: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _plantList[widget.plantId].plantName,
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),

                        Row(
                          children: [
                            Text(
                              _plantList[widget.plantId].rating.toString(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 25.0,
                                  color: Constants.primaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Icon(
                              Icons.star,
                              size: 25.0,
                              color: Constants.primaryColor,
                            ),
                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text(
                          '₹' +
                              _plantList[widget.plantId]
                                  .price
                                  .toString(),
                          style: GoogleFonts.montserrat(
                            color: Constants.blackColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildOutlineButton(
                              icon: Icons.remove,
                              press: () {
                                if (numOfItems > 1) {
                                  setState(() {
                                    numOfItems--;
                                  });
                                }
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                numOfItems.toString().padLeft(2, "0"),
                                style: GoogleFonts.montserrat(
                                    color: Constants.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24
                                ),
                              ),
                            ),
                            buildOutlineButton(
                                icon: Icons.add,
                                press: () {
                                  setState(() {
                                    numOfItems++;
                                  });
                                }),

                          ],
                        )

                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    // Expanded(
                    //   child: Text(
                    //     _plantList[widget.plantId].decription,
                    //     textAlign: TextAlign.justify,
                    //     style: GoogleFonts.montserrat(
                    //       height: 1.5,
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.w600,
                    //       color: Constants.blackColor.withOpacity(.7),
                    //     ),
                    //   ),
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          iconColor: Colors.green.shade900,
                          collapsedIconColor: Colors.green.shade900,
                          title: Text(
                            "Description",
                            style: GoogleFonts.montserrat(
                              color: Colors.green.shade900,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            Text(
                              _plantList[widget.plantId].decription,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(
                                height: 1.5,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Constants.blackColor.withOpacity(.7),
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(
                        //   height: 5.0,
                        // ),
                        ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          iconColor: Colors.green.shade900,
                          collapsedIconColor: Colors.green.shade900,
                          title: Text(
                            "How to Grow and Care",
                            style: GoogleFonts.montserrat(
                              color: Colors.green.shade900,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            Text(
                              _plantList[widget.plantId].care,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(
                                height: 1.5,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Constants.blackColor.withOpacity(.7),
                              ),
                            ),
                          ],
                        ),
                        ExpansionTile(
                          initiallyExpanded: true,
                          iconColor: Colors.green.shade900,
                          collapsedIconColor: Colors.green.shade900,
                          tilePadding: EdgeInsets.zero,
                          title: Text(
                            "Photos",
                            style: GoogleFonts.montserrat(
                              color: Colors.green.shade900,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            SizedBox(
                              height: size.height * .35,
                              child: ListView.builder(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  itemCount: _plantList[widget.plantId]
                                      .plantImages
                                      .length,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (BuildContext context, int i) {
                                    return GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: InteractiveViewer(
                                                maxScale: 3,
                                                minScale: 1,
                                                child: Container(
                                                    height: 400,
                                                    width: 700,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              _plantList[widget
                                                                      .plantId]
                                                                  .plantImages[i]),
                                                          fit: BoxFit.cover),
                                                    )),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 250,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  _plantList[widget.plantId]
                                                      .plantImages[i]),
                                              fit: BoxFit.cover),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.grey,
                                                spreadRadius: 0,
                                                offset: Offset(3, 3))
                                          ],
                                          color: Color(0xff86bd99),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        // child: Image.asset(_plantList[widget.plantId].plantImages[i],fit: BoxFit.cover),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 55,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      bool isSelected = toggleIsSelected(
                          _plantList[widget.plantId].isSelected);

                      _plantList[widget.plantId].isSelected = isSelected;
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: _plantList[widget.plantId].isSelected == true
                        ? Colors.white
                        : Constants.primaryColor,
                  )),
              decoration: BoxDecoration(
                  color: _plantList[widget.plantId].isSelected == true
                      ? Constants.primaryColor.withOpacity(.5)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(.3),
                    ),
                  ]),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Payment()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          color: Constants.primaryColor.withOpacity(.3),
                        )
                      ]),
                  child: Center(
                    child: Text(
                      'BUY NOW',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildOutlineButton(
      {required IconData icon, void Function()? press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(

        style: OutlinedButton.styleFrom(
         foregroundColor: Colors.green.shade900,
          padding: EdgeInsets.zero,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: Colors.green.shade900,
          size: 25,
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;

  const PlantFeature({
    Key? key,
    required this.plantFeature,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
              color: Constants.blackColor, fontWeight: FontWeight.w600),
        ),
        Text(
          plantFeature,
          style: GoogleFonts.montserrat(
            color: Constants.primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
