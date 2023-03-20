import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/account.dart';
import 'package:flutter_onboarding/ui/screens/profile_page.dart';
import 'package:flutter_onboarding/ui/screens/root_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../constant.dart';
import '../notification/components/defaultAppBar.dart';
import '../notification/components/defaultBackButton.dart';
import '../widgets/emptySection.dart';

class Chat extends StatefulWidget {
  Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: "Chat",
        child: DefaultBackButton(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: EmptySection(
              emptyImg: "assets/images/plant-three.png",
              emptyMsg: "No message yet",
            ),
          ),
          Expanded(
            flex: 0,
            child: Material(
              elevation: kLess,
              color: kWhiteColor,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: kLess),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        return CallMe();
                      },
                      icon: Icon(
                        Icons.call,
                        color: Colors.green.shade900,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: kLess),
                        padding: EdgeInsets.symmetric(horizontal: kLessPadding),
                        decoration: BoxDecoration(
                            border: Border.all(color: kAccentColor),
                            color: kWhiteColor),
                        child: TextField(
                          controller: controller,
                          style: GoogleFonts.montserrat(color: kLightColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                          cursorColor: kPrimaryColor,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(

                            border: InputBorder.none,
                            hintText: "Enter some text to send message",
                            hintStyle: GoogleFonts.montserrat(
                                color: kLightColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        return launchEmail();
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.green.shade900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  launchEmail() async {
    launchUrl(
      Uri.parse(
          'mailto:ishandholariya111@gmail.com?body= ${controller.text}'),
      mode: LaunchMode.externalApplication,
    ).whenComplete(() {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => Chat(),), (route) => false);
    });
  }

  CallMe()async {

    await launchUrl(Uri.parse("tel:6354048838"));

  }
}
