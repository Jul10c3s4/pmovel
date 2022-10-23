import 'package:flutter/material.dart';
import 'package:app/pages/principal/explore_page.dart';
import 'package:app/widgets/nav_drawer.dart';
import 'package:app/pages/principal/destaque_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List pages = [
    const DestaquePage(),
    const ExplorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xff180c36),
        title: const Text('MEMSTUDY'),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
        ],
        selectedItemColor: const Color(0xFFD0C3F1),
        unselectedItemColor: Colors.white,
        backgroundColor: const Color(0xFF351B75),
      ),
    );
  }
}
