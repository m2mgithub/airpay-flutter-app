import 'dart:io';

import 'package:airpay/src/controllers/qrcode_controller.dart';
import 'package:flutter/material.dart';
import 'package:airpay/src/theme/index.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrcodeScannerScreen extends StatefulWidget {
  const QrcodeScannerScreen({ Key? key }) : super(key: key);

  @override
  _QrcodeScannerScreenState createState() => _QrcodeScannerScreenState();
}

class _QrcodeScannerScreenState extends State<QrcodeScannerScreen> {
  final QrcodeController _qrcodeController = Get.put(QrcodeController());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode result;
  late QRViewController controller;

  @override
  void reassemble() {
    super.reassemble();
    if(Platform.isAndroid) {
      controller.pauseCamera();
    } else if(Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(.1),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Scan QR Code',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: size.height * .08,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32)
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        _qrcodeController.toogleTab('scanner');
                      },
                      child: Obx(() => Container(
                        width: size.width * .4,
                        height: size.height * .05,
                        decoration: BoxDecoration(
                          color: (_qrcodeController.selectedTab.value == 'scanner') ? kOrangeMain : Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text(
                            'Scan QR',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ),
                      )),
                    ),
                    GestureDetector(
                      onTap: (){
                        _qrcodeController.toogleTab('qrcode');
                      },
                      child: Obx(() => Container(
                        width: size.width * .4,
                        height: size.height * .05,
                        decoration: BoxDecoration(
                          color: (_qrcodeController.selectedTab.value == 'qrcode') ? kOrangeMain : Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text(
                            'My QR Code',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * .05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Scan QR to Send Money, Cashout or Pay Bills with Airpay',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: size.height * .08),
            Center(
              child: Obx(() => Container(
                height: size.height * .4,
                width: size.width,
                // color: Colors.red
                child: (_qrcodeController.selectedTab.value == 'scanner')
                  ? QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: kOrangeMain,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                      ),
                    )
                  : Expanded(flex: 1, child: Container(color: Colors.red,)),
              )),
            ),
            SizedBox(height: size.height * .05),
            Text(
              'Position the QR Code inside the frame to scan',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * .05),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () async{
                  await controller.toggleFlash();
                },
                icon: Icon(
                  Icons.flash_on_rounded,
                  color: Colors.white,
                  size: 30
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}