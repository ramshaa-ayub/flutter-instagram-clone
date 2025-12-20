import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/Screens/Heart/heartscreen.dart';
import 'package:flutter_insta_clone/Screens/Home/homescreen.dart';
import 'package:flutter_insta_clone/Screens/Post/postscreen.dart';
import 'package:flutter_insta_clone/Screens/Profile/profilescreen.dart';
import 'package:flutter_insta_clone/Screens/Search/searchscreen.dart';
import 'package:flutter_insta_clone/Widgets/uihelper.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    PostScreen(),
    HeartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.plus_app),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: "Heart",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
      ),
      body: IndexedStack(children: pages, index: currentIndex),
    );
  }
}
