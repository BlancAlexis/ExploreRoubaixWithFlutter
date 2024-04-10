import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template_flutter_but/ui/screens/favorite/favorite_view_screen.dart';
import 'package:template_flutter_but/ui/screens/map/map.screen.dart';

import '../home/home.screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const HomeScreen(),
    const MapSample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TenorFlut'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Lieux favories'),
              onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => const FavoriteViewScreen(
                     ),
                   ),
                 );
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Catégorie',
          ),
        ],
      ),
    );
  }
}