import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_onboarding/models/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  var getResults = "Scan to Open";
  Future<void>? _launched;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(.15),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('favorite');
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(.15),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          if (getResults.isNotEmpty) {
                            await Share.share(getResults);
                          }
                        },
                        icon: Icon(
                          Icons.share,
                          color: Constants.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 100,
            right: 20,
            left: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        scanQR();
                      },
                      child: Image.asset(
                        'assets/images/code-scan.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Tap Here to Scan',
                      style: GoogleFonts.montserrat(
                        color: Constants.primaryColor.withOpacity(.80),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            right: 20,
            left: 20,
            child: Center(
                child: InkWell(
              onTap: () {
                Clipboard.setData(new ClipboardData(text: getResults));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Copied to Clipboard",
                    style: GoogleFonts.montserrat(
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: Colors.green.shade50,
                  duration: Duration(seconds: 1),
                ));
                // key.currentState!.showSnackBar(
                //      SnackBar(content: new Text("Copied to Clipboard"),));
              },
              child: Text(
                getResults,
                style: GoogleFonts.montserrat(
                    color: Colors.green.shade900,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            )),
          ),
          Positioned(
              bottom: 100,
              right: 20,
              left: 20,
              child: Center(
                child: ElevatedButton(
                  onPressed: () => setState(() {
                    _launched = _launchInBrowser(Uri.parse(getResults));
                  }),
                  child: const Text('Launch in Browser'),
                ),
              )),
        ],
      ),
    );
  }

  void scanQR() async {
    try {
      final qrcode = await FlutterBarcodeScanner.scanBarcode(
          "#00FF00", "Cancel", false, ScanMode.QR);
      if (!mounted) return;

      setState(() {
        getResults = qrcode;
      });
      print("QR code Results :--");
      print(qrcode);
    } on PlatformException {
      getResults = 'Failed to scan plants';
    }
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
