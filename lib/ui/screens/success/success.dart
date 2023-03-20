import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:flutter_onboarding/ui/screens/orders/trackOrder.dart';
import 'package:flutter_onboarding/ui/screens/payment/payment_details.dart';
import 'package:flutter_onboarding/ui/screens/payment/transaction_summary.dart';
import 'package:flutter_onboarding/ui/screens/root_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant.dart';
import '../../../models/constants.dart';
import '../widgets/defaultButton.dart';
import '../widgets/emptySection.dart';
import '../widgets/subTitle.dart';

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RootPage(),), (route) => false);
        return false;
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end
          ,
          children: [
            EmptySection(
              emptyImg: "assets/images/successful-icon-10.jpg",
              emptyMsg: 'Successful !!',
            ),
            SubTitle(
              subTitleText: 'Your payment was done successfully',
            ),

            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrackOrder(),
                    ),
                        );
              },
              child: Container(
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.green.shade500,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.green.shade900.withOpacity(.3),
                      )
                    ]),
                child:  Center(
                  child: Text(
                    'Track Order',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),

            InkWell(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => transactionSummary()));
              },
              child: Container(
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.green.shade500,
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
                    'Transaction Details',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 160,),
            InkWell(
              onTap: (){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RootPage(),
                    ),
                        (route) => false);
              },
              child: Container(
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.green.shade900.withOpacity(.3),
                      )
                    ]),
                child:  Center(
                  child: Text(
                    'Go Home',
                    style: GoogleFonts.montserrat(
                        color: Colors.black54,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            // DefaultButton(
            //     btnText: 'Ok',
            //     onPressed: () => Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => RootPage(),
            //         ),
            //         (route) => false)),
          ],
        ),
      ),
    );
  }
}
