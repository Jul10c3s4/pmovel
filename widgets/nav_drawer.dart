import 'package:flutter/material.dart';
import 'package:app/pages/jogos_pages.dart';

class NavDrawer extends StatelessWidget {
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
                image: NetworkImage('https://cdn.pixabay.com/photo/2016/11/01/08/16/brain-1787622_1280.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.person_outlined),
            title: const Text('Perfil'),
            onTap: () => {
              Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Seus cards'),
            onTap: () => {
              Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: const Icon(Icons.games_outlined),
            title: const Text('Jogos'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JogosPage()),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {
              Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {
              Navigator.of(context).pop()
            },
          ),
        ],
      ),
    );
  }
}
