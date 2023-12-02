import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String message = 'https://ondev.ca';
    const double size = 250.0;

    final FutureBuilder<ui.Image> qrFutureBuilder = FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
      builder: (BuildContext ctx, AsyncSnapshot<ui.Image> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(width: size, height: size);
        }
        return CustomPaint(
          size: const Size.square(size),
          painter: QrPainter(
            data: message,
            version: QrVersions.auto,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Colors.black,
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.circle,
              color: Colors.black,
            ),
            embeddedImage: snapshot.data,
            embeddedImageStyle: const QrEmbeddedImageStyle(
              size: Size.square(1),
            ),
          ),
        );
      },
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 25.0,
                ),
                const CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage("images/robert.png"),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  "Tony Stark",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "GENIUS | BILLIONAIRE | PLAYBOY | PHILANTHROPIST",
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.blueGrey.shade100,
                    fontFamily: 'Gabarito',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150,
                  child: Divider(
                    color: Colors.blueGrey.shade100,
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.blueGrey,
                    ),
                    title: Text(
                      "+1 999 999-9999",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blueGrey.shade900,
                        fontFamily: 'Gabarito',
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                      color: Colors.blueGrey,
                    ),
                    title: Text(
                      "tony@stark-industries.com",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blueGrey.shade900,
                        fontFamily: 'Gabarito',
                        letterSpacing: 2.5,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0), // Adjust the padding value as needed
                    child: Center(
                      child: SizedBox(
                        width: size,
                        child: qrFutureBuilder,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<ui.Image> _loadOverlayImage() async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    final ByteData byteData =
    await rootBundle.load('images/robert.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }
}
