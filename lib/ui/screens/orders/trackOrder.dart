
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant.dart';
import '../notification/components/defaultAppBar.dart';
import '../notification/components/defaultBackButton.dart';
import '../root_page.dart';
import '../widgets/defaultButton.dart';
import '../widgets/icon_stepper.dart';

class TrackOrder extends StatefulWidget {
  TrackOrder({Key? key}) : super(key: key);

  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar:AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text("Track Order",style: GoogleFonts.montserrat(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Wed, 12 September",
              style: GoogleFonts.montserrat(
                fontSize: 18.0,
                color: kLightColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Order ID : 5136 - 9ui2 - 129i2",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: kLightColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
            ),
            child: Text(
              "Orders",
              style: GoogleFonts.montserrat(
                fontSize: 22.0,fontWeight: FontWeight.w600
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 6,
                child: IconStepper(
                  direction: Axis.vertical,
                  enableNextPreviousButtons: false,
                  enableStepTapping: false,
                  stepColor: Colors.green,
                  activeStepBorderColor: kWhiteColor,
                  activeStepBorderWidth: 0.0,
                  activeStepBorderPadding: 0.0,
                  lineColor: Colors.green,
                  lineLength: 70.0,
                  lineDotRadius: 2.0,
                  stepRadius: 16.0,
                  icons: [
                    Icon(Icons.radio_button_checked, color: Colors.green),
                    Icon(Icons.check, color: kWhiteColor),
                    Icon(Icons.check, color: kWhiteColor),
                    Icon(Icons.check, color: kWhiteColor),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: trackOrderList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 16.0),
                            leading: Icon(
                              trackOrderList[index].icon,
                              size: 48.0,
                              color: Colors.green.shade900,
                            ),
                            title: Text(
                              trackOrderList[index].title.toString(),
                              style: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 18.0),
                            ),
                            subtitle: Text(
                              trackOrderList[index].subtitle.toString(),
                              style: GoogleFonts.montserrat(fontSize: 16.0),
                            ),
                          ),
                        ),
                        Text(
                          trackOrderList[index].time.toString(),
                          style: GoogleFonts.montserrat(fontSize: 18.0),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            padding: EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
            decoration: BoxDecoration(
              color: kWhiteColor,
              border: Border.all(
                width: 1,
                color: kLightColor,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Icon(Icons.home, size: 64.0, color: Colors.green.shade900),
                SizedBox(width: 32.0),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Address",
                        style: GoogleFonts.montserrat(fontSize: 20.0,fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Home Address",
                        style: GoogleFonts.montserrat(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                          color: kDarkColor.withOpacity(0.7),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          "House No: 12, Ram Krushna Row-House MotaVarachha Surat,394101",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: kDarkColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),



        ],
      ),
    );
  }
}
