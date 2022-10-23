import 'dart:ui';

import 'package:app/data/sharedPreferences.dart';
import 'package:app/pages/principal/home_page.dart';
import 'package:app/pages/telas%20de%20login/login.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:splashscreen/splashscreen.dart';

class Screen extends StatefulWidget {
  final String rota;
  const Screen({key, required this.rota}) : super(key: key);
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  void initState() {
    super.initState();
    animacao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1E1040),
        body: Center(
            child: Container(
              child: Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.cover,
              ),
            ),
));
  }

  void animacao() async {
    await Future.delayed(const Duration(seconds: 4));

    bool isLogged = await SharedPrefsHelper().getUser();
    if(isLogged == true){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context){
            return const HomePage();
          }));
    }else{
      Navigator.pushReplacementNamed(context, widget.rota);
    }
  }
}
