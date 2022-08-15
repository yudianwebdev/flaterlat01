// ignore_for_file: prefer_const_constructors

import 'package:flaterlat01/Components/AdsBanner.dart';
import 'package:flaterlat01/Components/WebView.dart';
import 'package:flaterlat01/Components/bottom_navigation.dart';
import 'package:flaterlat01/Pages/listwallpaper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'tes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const WebViewPage());
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
  late AdWidget adWidget;

  @override
  void initState() {
    super.initState();
    myBanner.load();
    adWidget = AdWidget(ad: myBanner);
    // Load ads.
  }

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    // ignore: avoid_print
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      // ignore: avoid_print
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    // ignore: avoid_print
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    // ignore: avoid_print
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    // ignore: avoid_print
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: BottomNavigation()));
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
