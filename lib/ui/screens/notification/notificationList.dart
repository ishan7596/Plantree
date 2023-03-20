
import '../../../constant.dart';
import 'components/defaultBackButton.dart';
import 'package:flutter/material.dart';
import 'components/defaultAppBar.dart';
import 'components/notificationTiles.dart';
import 'notificationPage.dart';

class NotificationList extends StatefulWidget {
  NotificationList({ Key? key}) : super(key: key);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: 'Notifications',

        child: DefaultBackButton(),
      ),
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 20,
          itemBuilder: (context, index) {
            return NotificationTiles(

              title: 'Plantree',
              subtitle: 'Thanks for download Plantree app.',
              enable: true,
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationPage())),


            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}
