import 'package:compass_browser/components/windows_titlebar.dart';
import 'package:compass_browser/newtab.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.deepPurple, Colors.blue],
        ),
      ),
      padding: const EdgeInsets.all(220),
      child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Welcome to Compass.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.fade,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Your browser, materialized.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            NewTab(),
          ]),
    );
  }
}
