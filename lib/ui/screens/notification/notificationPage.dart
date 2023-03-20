import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant.dart';
import 'components/defaultAppBar.dart';
import 'components/defaultBackButton.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: 'Notification',
        child: DefaultBackButton(),
      ),

      body: FittedBox(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(kFixPadding),
          padding: EdgeInsets.all(kFixPadding),
          decoration: BoxDecoration(
              color: kWhiteColor,

              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [BoxShadow(color: kLightColor, blurRadius: 2.0)]),
          child: Column(
            children: [
              Text(
                "Plants are the silent heroes that sustain life on earth.",
                // "Plants are the lifeline of our planet, providing us with food, oxygen, and a healthy environment. They are essential to the survival of all living beings and play a crucial role in maintaining the balance of our ecosystem.",
                // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20,),
              ),
              SizedBox(height: 16.0),
              Container(
                  height: 300,
                  child:
                      Image(image: AssetImage("assets/images/plant-four.png"))),
              SizedBox(height: 16.0),
              Text(
                  "Plants have numerous applications in different areas such as food, medicine, cosmetics, agriculture, and even energy production. They provide us with essential nutrients, oxygen, and help maintain the balance of our ecosystem. Plant-derived compounds are used in the development of drugs, fragrances, and skincare products. Plants also play a crucial role in crop production and soil conservation. Moreover, they can be used as biofuels and in the production of renewable energy. Plants have a significant impact on our lives and the environment, making them an essential component of our world.",
                  // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.montserrat(
                      color: kLightColor, fontWeight: FontWeight.w500)),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Text('11/Feb/2021  04:42 PM',
                    style: GoogleFonts.montserrat(
                        color: kLightColor, fontWeight: FontWeight.w600)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
