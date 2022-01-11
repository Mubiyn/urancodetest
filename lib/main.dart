import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urancodetest/globals.dart';
import 'package:urancodetest/resources/resources.dart';
import 'package:urancodetest/ui/screens/exhibit_screen.dart';

void main() {
  runApp(
    MediaQuery(
      // for responsive design, not really required if designing for most screens....
      data: MediaQueryData(),
      child: UranTest(),
    ),
  );
}

class UranTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: theme(context),
      debugShowCheckedModeBanner: false,
      home: UranTestSplashScreen(),
    );
  }
}

class UranTestSplashScreen extends StatefulWidget {
  UranTestSplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _UranTestSplashScreenState createState() => _UranTestSplashScreenState();
}

class _UranTestSplashScreenState extends State<UranTestSplashScreen> {
  @override
  void initState() {
    super.initState();
    log("splash started");
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => ExhibitScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    reinitDimensionConfig(context);
    setState(() {});
    final double space = MediaQuery.of(context).size.height / 4;
    return Scaffold(
      backgroundColor: theme(context).primaryColor.withOpacity(0.6),
      body: Padding(
        padding: EdgeInsets.only(top: space),
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/icons/splash.svg',
                fit: BoxFit.fill,
                height: dimension.buttonHeight! * 3,
                width: dimension.buttonHeight! * 1.8,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: dimension.buttonHeight!),
              child: Text(
                "Uran Test",
                style: textTheme().bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
