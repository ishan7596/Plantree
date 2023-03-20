
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../chat/chat.dart';
import '../notification/components/defaultAppBar.dart';
import '../notification/components/defaultBackButton.dart';
import '../widgets/defaultButton.dart';
import '../widgets/emptySection.dart';
import '../widgets/subTitle.dart';

class CallCenter extends StatefulWidget {
  CallCenter({Key? key}) : super(key: key);

  @override
  _CallCenterState createState() => _CallCenterState();
}

class _CallCenterState extends State<CallCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: "Call Center",
        child: DefaultBackButton(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: "assets/images/plant-three.png",
            emptyMsg: "We're happy to help you!",
          ),
          SubTitle(
            subTitleText: "If you have complain about the product chat me",
          ),
          DefaultButton(
            btnText: "Contact Me",
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Chat(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
