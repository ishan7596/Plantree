import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/root_page.dart';
import 'package:flutter_onboarding/ui/screens/success/success.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../constant.dart';
import '../notification/components/defaultAppBar.dart';
import '../notification/components/defaultBackButton.dart';
import '../widgets/defaultButton.dart';
import '../widgets/stickyLabel.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  PaymentDetailsState createState() => PaymentDetailsState();
}

class PaymentDetailsState extends State<PaymentDetails> {
  String cardNumber = "5450 7879 4864 7854",
      cardExpiry = "10/25",
      cardHolderName = "Ishan Dholariya",
      bankName = "SBI Bank",
      cvv = "456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: "Credit Card Payment",
        child: DefaultBackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: cardExpiry,
              cardHolderName: cardHolderName,
              bankName: bankName,
              cvv: cvv,
              // showBackSide: true,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              cardType: CardType.masterCard,
              showShadow: true,
            ),
            StickyLabel(
                text: "Card Information", textColor: Colors.green.shade900),
            const SizedBox(height: 8.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                color: kWhiteColor,
                border: Border.all(
                  width: 1,
                  color: Colors.black54,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("My Perosnal Card",
                            style: GoogleFonts.montserrat(
                                fontSize: 18.0, fontWeight: FontWeight.w600)),
                        SizedBox(
                            width: 60.0,
                            child: Icon(Icons.payment,
                                color: Colors.green.shade900, size: 40.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Number",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                color: kLightColor,
                              ),
                            ),
                            Text(
                              cardNumber,
                              style: GoogleFonts.montserrat(
                                  fontSize: 16.0, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Exp.",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  color: kLightColor,
                                ),
                              ),
                              Text(
                                cardExpiry,
                                // style: GoogleFonts.montserrat(fontSize: 16.0,fontWeight: FontWeight.w500),
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Name",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                color: kLightColor,
                              ),
                            ),
                            Text(
                              cardHolderName,
                              style: GoogleFonts.montserrat(
                                  fontSize: 16.0, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CVV",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  color: kLightColor,
                                ),
                              ),
                              Text(
                                cvv,
                                style: GoogleFonts.montserrat(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                    width: MediaQuery.of(context).size.width,
                    child: MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      color: Colors.green.shade900.withOpacity(0.2),
                      child: Text(
                        "Edit Detail",
                        style: GoogleFonts.montserrat(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () => print("Edit Detail"),
                    ),
                  ),
                ],
              ),
            ),
            // StickyLabel(text: "Transaction Details", textColor: Colors.green.shade900),
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            //   decoration: BoxDecoration(
            //     color: kWhiteColor,
            //     border: Border.all(
            //       width: 1,
            //       color: Colors.black54,
            //     ),
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            //   child: ListView.separated(
            //     shrinkWrap: true,
            //     itemCount: paymentDetailList.length,
            //     itemBuilder: (context, index) {
            //       return Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             paymentDetailList[index].date.toString(),
            //             style: GoogleFonts.montserrat(
            //               fontSize: 16.0,
            //               fontWeight: FontWeight.w500,
            //               color: kLightColor,
            //             ),
            //           ),
            //           SizedBox(
            //             width: 190.0,
            //             child: Text(
            //               paymentDetailList[index].details.toString(),
            //               style: GoogleFonts.montserrat(fontSize: 16.0,fontWeight: FontWeight.w600),
            //             ),
            //           ),
            //           SizedBox(
            //             width: 70.0,
            //             child: Text(
            //               "\$ ${paymentDetailList[index].amount}",
            //               style: GoogleFonts.montserrat(
            //                 fontSize: 16.0,
            //                 fontWeight: FontWeight.w500,
            //                 color: paymentDetailList[index].textColor,
            //               ),
            //             ),
            //           ),
            //         ],
            //       );
            //     },
            //     separatorBuilder: (context, index) {
            //       return Divider(
            //         thickness: 0.5,
            //   // endIndent: 10,
            //         color: Colors.green.shade900,
            //       );
            //     },
            //   ),
            // ),
            const SizedBox(height: 70.0),
            // DefaultButton(
            //   btnText: 'Pay',
            //   onPressed: () => Navigator.pushAndRemoveUntil(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => Success(),
            //       ),
            //       (route) => false),
            // ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SlideAction(

                borderRadius: 50,
                elevation: 0,
                innerColor: Colors.green.shade900,
                outerColor: Colors.green.shade100,

                sliderButtonIcon: Icon(
                  Icons.lock_open,
                  color: Colors.white70,
                ),
                text: 'Slide To Pay',
                textStyle: GoogleFonts.montserrat(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
                sliderRotate: true,
                onSubmit: ()=> Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Success()), (
                    route) => false),

              ),
            ),

            // const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
