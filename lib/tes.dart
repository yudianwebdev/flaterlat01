import 'dart:math';

import 'package:flutter/material.dart';

class Tess extends StatefulWidget {
  const Tess({Key? key}) : super(key: key);

  @override
  State<Tess> createState() => _TessState();
}

class _TessState extends State<Tess> {
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: 50.0 + random.nextInt(101),
          height: 50.0 + random.nextInt(101),
          color: Color.fromARGB(225, random.nextInt(226), random.nextInt(226),
              random.nextInt(226)),
        ),
      ),
    );
  }
}
