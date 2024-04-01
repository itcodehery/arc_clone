import 'package:arc_clone/navdrw.dart';
import 'package:arc_clone/newtab.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: const Row(children: [
        Navdrw(),
        NewTab(),
      ]),
    );
  }
}
