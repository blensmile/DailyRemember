import 'dart:async';

import 'package:daily_reminder/tools/route_helper.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: //downcount 3s
            //picture and text to show countdown
            Stack(children: [
      // Image.asset("assets/images/welcome.png"),
      //background blue
      Container(color: Colors.blue),
      const Align(
        alignment: Alignment.topRight,
        child: Padding(
            padding: EdgeInsets.only(top: 40, right: 20), child: CountDown()),
      ),
    ]));
  }
}

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  int count = 3;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count--;
      if (count-- < 0) {
        timer.cancel();
        RouteHelper.instance.routeWithAnimation(context, const HomePage(),
            replace: true, clearStack: true);
      } else {
        setState(() {});
      }
    });
    //timer start
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Count $count",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
