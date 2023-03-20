import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:flutter_onboarding/ui/screens/payment/payment.dart';
import 'package:flutter_onboarding/ui/screens/root_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/defaultButton.dart';
import 'package:flutter_onboarding/ui/screens/widgets/plant_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addedToCartPlants;

  const CartPage({Key? key, required this.addedToCartPlants}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.addedToCartPlants.isEmpty
          ? Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => RootPage()),
                          (route) => false);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      // child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.of(context).pushAndRemoveUntil(
                      //           MaterialPageRoute(
                      //               builder: (context) => RootPage()),
                      //           (route) => false);
                      //     },
                          child: Image.asset('assets/images/add-cart.png')),

                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your Cart is Empty \nClick here to Add Plants',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(

                        color: Constants.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: widget.addedToCartPlants.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return PlantWidget(
                              index: index,
                              plantList: widget.addedToCartPlants);
                        }),
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Total :',
                            style: GoogleFonts.montserrat(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: Colors.green.shade900),
                          ),

                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Payment()));
                            },
                            child: Container(
                              width: 130,
                              height: 40,
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
                              child:  Center(
                                child: Text(
                                  'Pay \$${total()}',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Text(
                          //   r'$'+total(),
                          //   style: GoogleFonts.montserrat(
                          //     fontSize: 24.0,
                          //     color: Constants.primaryColor,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
  String total(){
    int a = 0;
    for(Plant i in widget.addedToCartPlants){
      a += i.price;

    }
    return a.toString();

  }

}
