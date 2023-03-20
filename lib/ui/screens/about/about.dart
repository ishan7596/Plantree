import 'package:flutter/material.dart';
import '../../../constant.dart';
import '../notification/components/defaultAppBar.dart';
import '../notification/components/defaultBackButton.dart';
import '../notification/components/notificationTiles.dart';
import 'components/descSection.dart';

class About extends StatefulWidget {
  About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DefaultAppBar(
        title: 'About Application',
        child: DefaultBackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NotificationTiles(
              title: 'Plantree',
              subtitle: 'Online Plant Shop',
              enable: false, onTap: () { },
            ),
            Divider(),
            DescSection(
              text:
                 "An online plant shop is a application that sells a variety of plants, including indoor and outdoor plants, succulents, cacti, and more. Customers can check the app and select the plants they want to purchase, and have them delivered directly to their doorstep. Online plant shops often offer a wide range of plants that may not be available at local nurseries or garden centers, and may provide helpful information on plant care and maintenance.",
                  // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            ),
            DescSection(
              text:
              "In addition to providing convenience for customers who may not have access to a physical plant shop, online plant shops often offer a wider selection of plants at competitive prices. Many also offer plant care resources, such as articles, videos, and tips for beginners. Some online plant shops may specialize in specific types of plants, such as rare or exotic varieties, while others may offer more general selections. Overall, an online plant shop can be a great resource for anyone looking to bring some greenery into their home or garden."
              // "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
            ),
          ],
        ),
      ),
    );
  }
}
