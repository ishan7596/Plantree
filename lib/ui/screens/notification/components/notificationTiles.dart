import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant.dart';

class NotificationTiles extends StatelessWidget {
  final String title, subtitle;
  final Function()? onTap;
  final bool enable;

  const NotificationTiles({
    Key? key, required this.title, required this.subtitle, required this.onTap, required this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 70.0,
          width: 60.0,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/plant-four.png"),),),),
      title: Text(title, style: GoogleFonts.montserrat(
          color: Colors.green.shade900, fontWeight:FontWeight.w600)),
      subtitle: Text(subtitle,
          style: GoogleFonts.montserrat(color: Colors.black54,fontWeight: FontWeight.w500)),
      onTap: onTap,
      enabled: enable,
    );
  }
}