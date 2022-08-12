import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsBanner extends StatefulWidget {
  const AdsBanner({Key? key}) : super(key: key);

  @override
  State<AdsBanner> createState() => _AdsBannerState();
}

class _AdsBannerState extends State<AdsBanner> {
  @override
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

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: adWidget,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );
  }
}
