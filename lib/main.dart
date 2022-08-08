// ignore_for_file: prefer_const_constructors

import 'package:flaterlat01/Components/bottom_navigation.dart';
import 'package:flutter/material.dart';
// import 'tes.dart';

void main() {
  runApp(const CumaText());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> widgetsapa = ["Test1", "Test2", "Test3"];
  List<Widget> widgets = [];
  // ignore: non_constant_identifier_names
  _MyAppState() {
    for (int i = 0; i < 105; i++) {
      widgets.add(Text("Data ke-" + i.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Membua List View"),
          ),
          body: ListView(
            children: [
              Text("data"),
              Text(
                'Headline',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 30,
                width: 40,
                child: ListView(
                  children: widgets,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Row(
                children: [
                  Text("data"),
                  Text("data3"),
                  Column(children: widgets)
                ],
              )
              // ListView(
              //   children: widgets,
              // ),
            ],
          )),
    );
  }
}

class LiatNomor extends StatefulWidget {
  const LiatNomor({Key? key}) : super(key: key);

  @override
  State<LiatNomor> createState() => _LiatNomorState();
}

class _LiatNomorState extends State<LiatNomor> {
  List<Widget> namawidget = [];

  _LiatNomorState() {
    for (int i = 0; i > 20; i++) {
      namawidget.add(Text("data nama ke-" + i.toString()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Text("Nama");
  }
}

class CumaText extends StatefulWidget {
  const CumaText({Key? key}) : super(key: key);

  @override
  State<CumaText> createState() => _CumaTextState();
}

class _CumaTextState extends State<CumaText> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BottomNavigation());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Text("ini Halaman Home"),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedNavbar = 0;
  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Berannda",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: "Pesanan",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          label: "Kotak Masuk",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Akun",
        ),
      ],
      currentIndex: _selectedNavbar,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: _changeSelectedNavBar,
    );
  }
}
