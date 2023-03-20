import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/widgets/defaultButton.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant.dart';
import '../notification/components/defaultAppBar.dart';
import '../root_page.dart';
import '../widgets/stickyLabel.dart';

class transactionSummary extends StatefulWidget {
  const transactionSummary({Key? key}) : super(key: key);

  @override
  State<transactionSummary> createState() => _transactionSummaryState();
}

class _transactionSummaryState extends State<transactionSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text("Payment Details",style: GoogleFonts.montserrat(
          color: Colors.green.shade900,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),),
        centerTitle: true,

        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.green.shade900),onPressed: (){
          Navigator.pop(context);
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RootPage(),), (route) => false);
        }),

      ),
body: Column(
  children: [StickyLabel(text: "Transaction Details", textColor: Colors.green.shade900),
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: kWhiteColor,
        border: Border.all(
          width: 1,
          color: Colors.black54,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: paymentDetailList.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                paymentDetailList[index].date.toString(),
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: kLightColor,
                ),
              ),
              SizedBox(
                width: 190.0,
                child: Text(
                  paymentDetailList[index].details.toString(),
                  style: GoogleFonts.montserrat(fontSize: 16.0,fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: 70.0,
                child: Text(
                  "\$ ${paymentDetailList[index].amount}",
                  style: GoogleFonts.montserrat(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: paymentDetailList[index].textColor,
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 0.5,
            // endIndent: 10,
            color: Colors.green.shade900,
          );
        },
      ),
    ),
SizedBox(height: 50),
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
            color: Colors.green.shade900,
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
                color: Colors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    ),
  ],
),
    );
  }
}
