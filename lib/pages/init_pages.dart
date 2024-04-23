

import 'dart:async';

import 'package:daily_reminder/tools/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_page.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: //downcount 3s
        //picture and text to show countdown
        Stack(
            children: [
              // Image.asset("assets/images/welcome.png"),
              //background blue
              Container(color: Colors.blue),
              Align(
                alignment: Alignment.topRight,
                child: Padding(padding: EdgeInsets.only(top: 40, right: 20), child: CountDown()),
              ),
            ]
        )
    );
  }

}

class CountDown extends StatefulWidget {


  CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {

  int count = 3;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        count--;
      });
    });
    //timer start
  }

  @override
  Widget build(BuildContext context) {
    if(count<1){
      timer?.cancel();
      RouteHelper.instance.routeWithAnimation(context, HomePage(),replace: true,clearStack: true);

    }
    return Container(
      child: Text("Count ${count}",style:TextStyle(color: Colors.white),),
    );
  }
}