import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_onboarding/models/constants.dart';
import 'package:flutter_onboarding/ui/screens/widgets/mySnackbar.dart';
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
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scanQR().then((value) {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: isLoading ? Center(child: CircularProgressIndicator()):Stack(
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
                      'Tap Here to Scan Again',
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
                showSnackbar("Copied", "Successfully Copied Link to Clipboard");
                // key.currentState!.showSnackBar(
                //      SnackBar(content: new Text("Copied to Clipboard"),));
              },
              child: Text(
                getResults,
                textAlign: TextAlign.center,
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

  Future scanQR() async {
    try {
      String qrcode = await FlutterBarcodeScanner.scanBarcode(
          "#00FF00", "Cancel", false, ScanMode.QR);
      if (!mounted) return;

      setState(() {
        if(qrcode == "-1"){
          getResults = "No QR Found" ;
        }else{
          getResults = qrcode;
        }

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
