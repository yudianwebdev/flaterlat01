import 'package:flaterlat01/Pages/listwallpaper.dart';
import 'package:flaterlat01/Pages/setwallpaper.dart';
import 'package:flaterlat01/main.dart';
import 'package:flaterlat01/tes.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
  late AdWidget adWidget;
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
        const ListWallpaper(),
        const ListWallpaper2(),
      ],
    );
  }

  Widget buildTitleView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        _changeSelectedNavBar(index);
      },
      children: const <Widget>[
        Text("Home"),
        Text("Home1"),
        Text("Home2"),
        Text("Home3"),
        Text("Home4")
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
