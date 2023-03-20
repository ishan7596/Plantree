
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../notification/components/defaultAppBar.dart';
import '../notification/components/defaultBackButton.dart';
import '../widgets/emptySection.dart';

class Message extends StatefulWidget {
  Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: 'Message',
        child: DefaultBackButton(),
      ),
      body: EmptySection(
        emptyImg: "assets/images/upload.png",
        emptyMsg: 'No message yet',
      ),
    );
  }
}
