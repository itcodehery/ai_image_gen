import 'package:flutter/material.dart';

class Canvas extends StatelessWidget {
  const Canvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_added_outlined),
          label: 'Saved',
          activeIcon: Icon(Icons.bookmark_added),
        ),
      ]),
      body: Column(
        children: [],
      ),
    );
  }
}
