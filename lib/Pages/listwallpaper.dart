import 'package:flaterlat01/Components/AdsBanner.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/wallpaper.dart';

class ListWallpaper extends StatelessWidget {
  const ListWallpaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          Container(color: Colors.cyan, child: const Text("ini Halaman Akun")),
          Container(
              color: Colors.amber,
              child: Row(
                children: [
                  Image.network(
                    "https://images.pexels.com/photos/9308054/pexels-photo-9308054.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    width: 100.00,
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                    children: const [Text("Asdf")],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class ListWallpaper2 extends StatefulWidget {
  const ListWallpaper2({Key? key}) : super(key: key);

  @override
  State<ListWallpaper2> createState() => _ListWallpaper2State();
}

class _ListWallpaper2State extends State<ListWallpaper2> {
  String home = "Home Screen",
      lock = "Lock Screen",
      both = "Both Screen",
      system = "System";

  late Stream<String> progressString;
  late String res;
  bool _isDisable = true;
  bool downloading = false;
  List<String> images = [
    "https://images.pexels.com/photos/10069890/pexels-photo-10069890.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/7037125/pexels-photo-7037125.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/8803905/pexels-photo-8803905.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/9556451/pexels-photo-9556451.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/10050591/pexels-photo-10050591.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/9000160/pexels-photo-9000160.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/9676202/pexels-photo-9676202.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/9308054/pexels-photo-9308054.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AdsBanner(),
            ListView(
              shrinkWrap: true,
              // ignore: prefer_const_constructors
              physics: NeverScrollableScrollPhysics(),
              children: images.map(
                (data) {
                  return Card(
                    child: Row(
                      children: [
                        Image.network(
                          data,
                          width: 100.00,
                          fit: BoxFit.fitWidth,
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                                onPressed: () async {
                                  return await dowloadImage(context, data);
                                },
                                child: Text(home)),
                            ElevatedButton(
                                onPressed: _isDisable
                                    ? null
                                    : () async {
                                        var width =
                                            MediaQuery.of(context).size.width;
                                        var height =
                                            MediaQuery.of(context).size.height;
                                        home = await Wallpaper.homeScreen(
                                            options:
                                                RequestSizeOptions.RESIZE_FIT,
                                            width: width,
                                            height: height);
                                        setState(() {
                                          downloading = false;
                                          home = home;
                                        });
                                        // ignore: avoid_print
                                        print("Task Done");
                                      },
                                child: Text(home)),
                            const Text("ini Halaman Akun"),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
              scrollDirection: Axis.vertical,
            ),
            ListView(
              shrinkWrap: true,
              // ignore: prefer_const_constructors
              physics: NeverScrollableScrollPhysics(),
              children: images.map(
                (data) {
                  return Card(
                    child: Row(
                      children: [
                        Image.network(
                          data,
                          width: 100.00,
                          fit: BoxFit.fitWidth,
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                                onPressed: () async {
                                  return await dowloadImage(context, data);
                                },
                                child: Text(home)),
                            ElevatedButton(
                                onPressed: _isDisable
                                    ? null
                                    : () async {
                                        var width =
                                            MediaQuery.of(context).size.width;
                                        var height =
                                            MediaQuery.of(context).size.height;
                                        home = await Wallpaper.homeScreen(
                                            options:
                                                RequestSizeOptions.RESIZE_FIT,
                                            width: width,
                                            height: height);
                                        setState(() {
                                          downloading = false;
                                          home = home;
                                        });
                                        // ignore: avoid_print
                                        print("Task Done");
                                      },
                                child: Text(home)),
                            const Text("ini Halaman Akun"),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
              scrollDirection: Axis.vertical,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> dowloadImage(BuildContext context, var data) async {
    progressString = Wallpaper.imageDownloadProgress(data);
    progressString.listen((data) {
      setState(() {
        res = data;
        downloading = true;
      });
      // ignore: avoid_print
      print("DataReceived: " + data);
    }, onDone: () async {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;
      home = await Wallpaper.homeScreen(
          options: RequestSizeOptions.RESIZE_FIT, width: width, height: height);
      setState(() {
        downloading = false;

        _isDisable = false;
        downloading = false;
        home = home;
      });

      // ignore: avoid_print
      print("Task Done");
    }, onError: (error) {
      setState(() {
        downloading = false;
        _isDisable = true;
      });
      // ignore: avoid_print
      print("Some Error");
    });
  }
}
