import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:si_covid/pages/pages.dart';

class MyRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (ctx) => Pages(settings.arguments));
        break;
      case '/province':
        return MaterialPageRoute(builder: (ctx) => Pages(settings.arguments));
        break;
      case '/tips':
        return MaterialPageRoute(builder: (ctx) => Pages(settings.arguments));
        break;
      case '/hospital':
        return MaterialPageRoute(builder: (ctx) => Pages(settings.arguments));
        break;
      default:
    }
  }
}
