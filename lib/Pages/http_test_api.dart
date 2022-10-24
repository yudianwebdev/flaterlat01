import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class HttpTestApi extends StatefulWidget {
  const HttpTestApi({Key? key}) : super(key: key);

  @override
  State<HttpTestApi> createState() => _HttpTestApiState();
}

class _HttpTestApiState extends State<HttpTestApi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FutureBuilder(
        future: getProduct(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data['Data'].length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                          width: 250,
                          height: 520,
                          child: Image.network(snapshot.data["Data"][index]
                                  ['images']
                              .replaceAll("localhost", "172.16.1.176"))),
                      Text('Result: ${snapshot.data['Data'][index]['id']}'),
                    ],
                  );
                });
          } else {
            return Text('data error bro');
          }
        },
      )),
    );
  }

  final String url = 'http://10.0.2.2:8000/api/list-all-bg/2';
  // 10.0.2.2
  Future getProduct() async {
    var res = await http.get(Uri.parse(url));
    print(jsonDecode(res.body));
    return jsonDecode(res.body);
  }
}
