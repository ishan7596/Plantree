
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
final void Function()? onTap;

  const ProfileWidget({
    Key? key,
    required this.icon,
    required this.title, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.green.shade50,
      splashColor: Colors.green.shade50,
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(

        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 5,),
                Icon(
                  icon,
                  color: Colors.green.shade900,
                  size: 24,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    color: Colors.green.shade900,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color:Colors.green.shade900,
              size: 20,
            ),

          ],
        ),
      ),
    );
  }
}