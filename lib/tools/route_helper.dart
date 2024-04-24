
import 'package:flutter/cupertino.dart';

class RouteHelper  {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String mine = '/mine';


  //singleton to get instance
  RouteHelper._();
  static final RouteHelper _instance = RouteHelper._();
  static RouteHelper get instance => _instance;

  // RouteHelper(this.widget,{RouteTransitionsBuilder transBuilder})
  //     : super(
  //     transitionDuration: const Duration(milliseconds: 400),
  //     pageBuilder: (context,anim1,anim2)=>widget,
  //     transitionsBuilder: transBuilder??getHorizontalTrans());

  //route with animation
  void routeTo(BuildContext context, Widget widget ){
    // Navigator.push(context, CupertinoPageRoute(builder: (context) => widget));

  }

  //route with animation
  void routeWithAnimation(BuildContext context, Widget widget, {bool replace = false, bool clearStack = false}){
    final route = CupertinoPageRoute(
      builder: (context) => widget
    );
    if (replace) {
      Navigator.pushReplacement(context, route);
    } else if (clearStack) {
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    } else {
      Navigator.push(context, route);
    }
  }

  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

}