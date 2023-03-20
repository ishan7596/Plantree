import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/payment/payment_details.dart';
import 'package:flutter_onboarding/ui/screens/settings/setting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constant.dart';
import '../notification/components/defaultAppBar.dart';
import '../notification/components/defaultBackButton.dart';
import '../orders/trackOrder.dart';
import '../root_page.dart';


class Report extends StatefulWidget {
  Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "Report Bug",
        child: DefaultBackButton(),
      ),
      // key: scaffoldKey,
      // backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(height: 500,width: 500,child: Image.asset("assets/images/plant-two.png")),
            SizedBox(height: 30,),
            Expanded(
              child: ListView.builder(
                // padding: EdgeInsets.only(top: 88.0),
                itemCount: labelss.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // dense: true,
                      leading: Icon(
                        iconss[index],
                        color: Colors.green.shade900,
                      ),
                      title: Text(
                        labelss[index],
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade900
                        ),
                      ),
                      onTap: () { switch (labelss[index]) {
                        case 'Call Me':
                          return CallMe();
                          break;

                        case 'E-Mail Me':
                          return EmailMe();
                          break;

                        case 'WatsApp Me':
                          return WatsappMe();
                          break;

                      }}
                    // onTap: () => this.setState(
                    //   () {
                    //     switch (labels[index]) {
                    //       case 'Notifications':
                    //         return snackBarMsg(context, 'Notifications');
                    //         break;
                    //       case 'Payments':
                    //         return snackBarMsg(context, 'Payments');
                    //         break;
                    //       case 'Message':
                    //         return snackBarMsg(context, 'Message');
                    //         break;
                    //       case 'My Orders':
                    //         return snackBarMsg(context, 'My Orders');
                    //         break;
                    //       case 'Setting Account':
                    //         return snackBarMsg(context, 'Setting Account');
                    //         break;
                    //       case 'Call Center':
                    //         return snackBarMsg(context, 'Call Center');
                    //         break;
                    //       case 'About Application':
                    //         return snackBarMsg(context, 'About Application');
                    //         break;
                    //       default:
                    //         return snackBarMsg(context, 'Notifications');
                    //         break;
                    //     }
                    //   },
                    // ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  snackBarMsg(BuildContext context, String msg) {
    var sb = SnackBar(
      elevation: kRadius,
      content: Text(msg),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        // textColor: kWhiteColor,
        label: 'OK',
        onPressed: () {},
      ),
    );
    // scaffoldKey.currentState.showSnackBar(sb);
  }

    CallMe()async {

     await launchUrl(Uri.parse("tel:6354048838"));

  }

   EmailMe() {
    launchUrl(
      Uri.parse(
          'mailto:ishandholariya111@gmail.com?subject=TestEmail&body= Hello'),
      mode: LaunchMode.externalApplication,
    );
  }

   WatsappMe() {
     launchUrl(
       Uri.parse(
           "https://api.whatsapp.com/send?phone=+916354048838=Hi"),
       mode: LaunchMode.externalApplication,
     );
   }
}
