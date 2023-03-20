
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant.dart';

class DefaultButton extends StatelessWidget {
  final String btnText;
  final Function()? onPressed;
  const DefaultButton({
    Key? key, required this.btnText, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: kLessPadding),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kShape)),
        color: Colors.green.shade900,
        textColor: kWhiteColor,
        highlightColor: kTransparent,
        onPressed: onPressed,
        child: Text(btnText.toUpperCase(),style: GoogleFonts.montserrat(fontWeight: FontWeight.w600)),
      ),
    );
  }
}