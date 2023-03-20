import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constant.dart';

class DescSection extends StatelessWidget {
  final String text;
  const DescSection({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kLessPadding, horizontal: kFixPadding),
      child:
          Text(text, textAlign: TextAlign.justify,style: GoogleFonts.montserrat(fontSize:17 )),
    );
  }
}