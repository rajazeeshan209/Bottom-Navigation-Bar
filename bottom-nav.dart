// ignore_for_file: file_names

import 'package:ecommerce/screens/cart.dart';
import 'package:ecommerce/screens/feeds.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/search.dart';
import 'package:ecommerce/screens/user_info.dart';
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
          Container(child: Home()),
          Cart(),
          Search(),
          Feeds(),
          UserInfo()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight *0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5
                )
              )
            ),
          child: BottomNavigationBar(
            onTap: onTapped,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).textSelectionColor,
            selectedItemColor: Colors.purple,
            currentIndex: _SelectedIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(null), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: 'Feed'),
              BottomNavigationBarItem(icon: Icon(Icons.info), label: 'User Info')
            ],
          ),
          ),
        ),
      ),
      floatingActionButtonLocation: 
        FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        hoverElevation: 10,
        splashColor: Colors.grey,
        tooltip: 'Search',
        elevation: 4,
        child: const Icon(Icons.search),
        onPressed: () => setState((){
          onTapped(2);
        }),
      )),
    );
  }
}
