import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  String title;
  String version;

  SplashPage({
    title = 'title',
    version = '9',
  });
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  void navigationToNextPage() {
    Navigator.pushReplacementNamed(context, '/index');
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    // remove barra de notificação fullscreen
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Container(
      height: double.infinity,
      width: 600.0,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: 200.0,
            image: AssetImage('src/img/logo.png'),
            fit: BoxFit.cover,
          ),
          Text(
            'IUPS\nBeta 0.1',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              decoration: TextDecoration.none,
              color: Colors.grey,
            ),
            // style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
      // new Image.asset('assets/splash.jpg', fit: BoxFit.fill),
    );
  }
}
