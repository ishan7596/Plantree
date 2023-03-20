import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant.dart';

class SubTitle extends StatelessWidget {
  final String subTitleText;
  const SubTitle({
    Key? key,
    required this.subTitleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kFixPadding),
      child: Text(
        subTitleText,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(fontSize: 18,fontWeight: FontWeight.w500),
      ),
    );
  }
}
