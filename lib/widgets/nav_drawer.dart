import 'package:app/data/sharedPreferences.dart';
import 'package:app/pages/principal/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/jogos_page.dart';
import 'package:app/pages/meu_card.dart';
import 'package:app/pages/materias_card.dart';
import 'package:app/pages/perfil_page.dart';
import 'package:app/pages/card_materias.dart';
import 'package:app/data/sharedPreferences.dart';


class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

// BD.cardatabase
class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'MEMSTUDY',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Color(0xff180c36),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2016/11/01/08/16/brain-1787622_1280.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outlined),
            title: const Text('Perfil'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PerfilPage()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Meus cards'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MeuCard()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.games_outlined),
            title: const Text('Jogos'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JogosPage()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('Matérias'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const  CardMaterias()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {Navigator.pushReplacementNamed(context, '/config')},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {
              SharedPrefsHelper().logout(),
              Navigator.pushReplacementNamed(context, '/login')         
            },
          ),
        ],
      ),
    );
  }
}
