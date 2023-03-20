import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constant.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final action;

  const DefaultAppBar({
    Key? key,
    required this.title,
    required this.child,
    this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: GoogleFonts.montserrat(
              color: Colors.green.shade900, fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: kWhiteColor,
      elevation: kRadius,
      automaticallyImplyLeading: false,
      // iconTheme: IconThemeData(color: Colors.green.shade900),
      leading: child,
      actions: action,
    );
  }
}
