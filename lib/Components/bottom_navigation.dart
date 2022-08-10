import 'package:flaterlat01/Pages/akun.dart';
import 'package:flaterlat01/Pages/setwallpaper.dart';
import 'package:flaterlat01/main.dart';
import 'package:flaterlat01/tes.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedNavbar = 0;
  String title = "Menu";
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
      pageController.jumpToPage(index);
    });
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        _changeSelectedNavBar(index);
      },
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        const HomePage(),
        const SetWallpaper(),
        const Tess(),
        const HomePage(),
        const AkunPage(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Pesanan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: "Pesan Masuk",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: "Pesan Masuk",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(0.0),
              child: Icon(Icons.person),
            ),
            label: "Akun",
          ),
        ],
        currentIndex: _selectedNavbar,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.brown,
        type: BottomNavigationBarType.fixed,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
