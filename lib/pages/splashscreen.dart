
import 'package:app/pages/home_page.dart';
import 'package:app/pages/login.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:splashscreen/splashscreen.dart';

class Screen extends StatefulWidget {
  const Screen({key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(); /*Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 10,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF1E1040),
            Colors.purple,
          ],
        ),
        navigateAfterSeconds: Login(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/splash.png"),
            fit: BoxFit.contain,
          ),
        ),
      ),
    ],
  );*/
  }
}
