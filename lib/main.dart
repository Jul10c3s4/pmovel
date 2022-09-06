
import 'package:app/pages/avalie-nos.dart';
import 'package:app/pages/central_ajuda.dart';
import 'package:app/pages/config_page.dart';
import 'package:app/pages/esqueci_senha_page.dart';
import 'package:app/pages/login.dart';
import 'package:app/pages/sobre.dart';
import 'package:app/pages/splashscreen.dart';
import 'package:app/pages/termos_uso.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/home_page.dart';
//import 'package:app/pages/login_page.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memstudy',
      initialRoute: '/splash',
      routes: <String, WidgetBuilder>{
        '/login': (context) => const Login(),
        '/esqueci': (context) => const EsqueciSenha(),
        '/config': (context) => const TelaConfig(),
        '/homepage': (context) => const HomePage(),
        '/central-ajuda': (context) => const CentralAjuda(),
        '/sobre': (context) => const Sobre(),
        '/avalie-nos': (context) => const Avalie(),
        '/splash':(context) => const Screen(rota: "/login"),
        '/termos_uso': ((context) => const Termos_uso())
      },
    );
  }
}
