// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({ Key? key }) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _SelectedIndex = 0;

  void onTapped(int index){
    setState(() {
      _SelectedIndex = index;
    });
    pageController.animateToPage(index, duration: Duration(milliseconds: 1000), curve: Curves.bounceIn);
  }
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('E-COMMERCE')),
      body: PageView(
        controller: pageController,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.blue),
          Container(color: Colors.cyan),
          Container(color: Colors.grey),
          Container(color: Colors.green),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feed'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.info), label: 'User Info')
      ],
      currentIndex: _SelectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      onTap: onTapped),
    );
  }
}