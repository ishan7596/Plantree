// import 'package:e_commerce/models/cartModal.dart';
import 'package:flutter/material.dart';

import 'models/paymentModal.dart';
import 'models/trackOrderModal.dart';

// import 'models/categoryModal.dart';
// import 'models/paymentModal.dart';
// import 'models/recommendedModal.dart';
// import 'models/reviewModal.dart';
// import 'models/trackOrderModal.dart';

const kPrimaryColor = Color(0xFFFF8084);
const kAccentColor = Color(0xFFF1F1F1);
const kWhiteColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFF808080);
const kDarkColor = Color(0xFF303030);
const kTransparent = Colors.transparent;

const kDefaultPadding = 24.0;
const kLessPadding = 10.0;
const kFixPadding = 16.0;
const kLess = 4.0;

const kShape = 30.0;

const kRadius = 0.0;
const kAppBarHeight = 56.0;

const kHeadTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
);

const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  color: kLightColor,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20.0,
  color: kPrimaryColor,
);

const kDarkTextStyle = TextStyle(
  fontSize: 20.0,
  color: kDarkColor,
);

const kDivider = Divider(
  color: kAccentColor,
  thickness: kLessPadding,
);

const kSmallDivider = Divider(
  color: kAccentColor,
  thickness: 5.0,
);

const String pieChart = 'assets/images/pieChart.png';
const String trophy = 'assets/images/trophy.png';
const String chat = 'assets/images/chat.png';
const String whiteShape = 'assets/images/whitebg.svg';
const String logo = 'assets/images/shoppingBag.png';
const String profile = 'assets/images/profile.jpg';
const String bg = 'assets/images/background.jpg';
const String manShoes = 'assets/images/manShoes.jpg';
const String success = 'assets/images/success.gif';
const String chatBubble = "assets/images/emptyChat.png";
const String emptyOrders = 'assets/images/orders.png';
const String callCenter = 'assets/images/center.png';
const String conversation = 'assets/images/conversation.png';

final paymentDetailList = [
  PaymentModal(
      date: "Jan 01",
      details: "Buy Plant",
      amount: 1000.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Aug 15",
      details: "Flat ₹650 off",
      amount: 650.0,
      textColor: Colors.green),
  PaymentModal(
      date: "Dec 03",
      details: "Congrats! Flat ₹180",
      amount: 180.0,
      textColor: Colors.green),
  PaymentModal(
      date: "Feb 14",
      details: "Buy Plant Upto 50% Off",
      amount: 540.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Sep 08",
      details: "Buy Plant on Discount",
      amount: 210.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Apr 18",
      details: "Congrats! ₹375 Rewarded",
      amount: 375.0,
      textColor: Colors.green),
];

// final paymentDetailList = [
//   PaymentModal(
//       date: "Jan 01",
//       details: "Buy IPhoneX",
//       amount: 1000.0,
//       textColor: Colors.red),
//   PaymentModal(
//       date: "Aug 15",
//       details: "Flat ₹650 off",
//       amount: 650.0,
//       textColor: Colors.green),
//   PaymentModal(
//       date: "Dec 03",
//       details: "Congrats! Flat ₹180",
//       amount: 180.0,
//       textColor: Colors.green),
//   PaymentModal(
//       date: "Feb 14",
//       details: "Buy Shoes Upto 50% Off",
//       amount: 540.0,
//       textColor: Colors.red),
//   PaymentModal(
//       date: "Sep 08",
//       details: "Buy Footwear on Discount",
//       amount: 210.0,
//       textColor: Colors.red),
//   PaymentModal(
//       date: "Apr 18",
//       details: "Congrats! ₹375 Rewarded",
//       amount: 375.0,
//       textColor: Colors.green),
// ];
final labels = [

  'Payments',

  'My Orders',
];

final labelss = [

  'Call Me',

  'E-Mail Me',

  'WatsApp Me',

];

final settingLabel = [
  'Account',
  'Address',
  'Telephone',
  'Email',
  'Setting',
  'Order Notifications',
  'Discount Notifications',
  'Credit Card',
  'Logout',
];


final trackOrderList = [
  TrackOrderModal(
      icon: Icons.card_travel,
      title: "Ready to Pickup",
      subtitle: "Order from Plantree",
      time: "08.00"),
  TrackOrderModal(
      icon: Icons.person,
      title: "Order Processed",
      subtitle: "We are preparing your order",
      time: "09.50"),
  TrackOrderModal(
      icon: Icons.payment,
      title: "Payment Confirmed",
      subtitle: "Awaiting Confirmation",
      time: "11.30"),
  TrackOrderModal(
      icon: Icons.receipt,
      title: "Order Placed",
      subtitle: "We have received your order",
      time: "02.15"),
];

final icons = [

  Icons.payment,

  Icons.local_dining,


];

final iconss = [

  Icons.call,

  Icons.mail,

  Icons.message,



];
final paymentLabels = [
  'Credit card / Debit card',
  'Cash on delivery',
  'Paypal',
  'UPI',
];

final paymentIcons = [
  Icons.credit_card,
  Icons.money_off,
  Icons.payment,
  Icons.account_balance_wallet,
];





