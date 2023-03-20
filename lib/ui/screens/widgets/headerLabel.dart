import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant.dart';

class HeaderLabel extends StatelessWidget {
  final String headerText;

  const HeaderLabel({
    Key? key,
    required this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Text(
        headerText,
        style: GoogleFonts.montserrat(
            color: Colors.green.shade900, fontSize: 28.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
