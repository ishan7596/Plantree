
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../notification/components/defaultAppBar.dart';
import '../notification/components/defaultBackButton.dart';
import '../widgets/emptySection.dart';

class Orders extends StatefulWidget {
  Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: 'My Orders',
        child: DefaultBackButton(),
      ),
      body: EmptySection(
        emptyImg: emptyOrders,
        emptyMsg: 'No orders yet',
      ),
    );
  }
}
