import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_evee/ui/screens/general/general_imports.dart';
import 'package:ride_evee/ui/screens/general/home/home_imports.dart';
import 'package:ride_evee/ui/screens/splash/splash_screen.dart';

class Routes {
  static const splash = "/";
  static const home = "/home";
  static const general = "/general";

  static String currentRoute = splash;
  static Route<dynamic> ongenerateRoute(RouteSettings settings) {
    //to track current route
    //this will only track pushed route on top of previous route
    currentRoute = settings.name ?? "";
    log("Current Route is $currentRoute");
    switch (settings.name) {
      case splash:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());
      case home:
        return CupertinoPageRoute(builder: (context) => const Home());
      case general:
        return CupertinoPageRoute(builder: (context) => General());

      default:
        return CupertinoPageRoute(builder: (context) => const Scaffold());
    }
  }
}
