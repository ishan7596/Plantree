import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/payment/payment_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../constant.dart';
import '../notification/components/defaultAppBar.dart';
import '../notification/components/defaultBackButton.dart';
import '../success/success.dart';
import '../widgets/defaultButton.dart';
import '../widgets/headerLabel.dart';

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: 'Payment',
        child: DefaultBackButton(),
      ),
      body: Column(
        children: [
          HeaderLabel(
            headerText: 'Choose your payment method',
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: Colors.green.shade900,
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = i as int),
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: GoogleFonts.montserrat(
                        color: kDarkColor, fontWeight: FontWeight.w600),
                  ),
                  trailing:
                      Icon(paymentIcons[index], color: Colors.green.shade900),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  indent: 20,
                  endIndent: 20,
                );
              },
            ),
          ),



          DefaultButton(
            btnText: 'Pay',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PaymentDetails(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
