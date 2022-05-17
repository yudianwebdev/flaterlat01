// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'tes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgets = [];
  // ignore: non_constant_identifier_names
  _MyAppState() {
    LiatNomor();
    for (int i = 0; i < 15; i++) {
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
          body: Container(
            child: Column(
              children: [
                Text("data"),
                Container(
                  child: Row(
                    children: [
                      Text("data"),
                      Text("data3"),
                      Container(
                        child: Column(children: widgets),
                      )
                    ],
                  ),
                )
                // ListView(
                //   children: widgets,
                // ),
              ],
            ),
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
    return Text("ini cuma Text");
  }
}
