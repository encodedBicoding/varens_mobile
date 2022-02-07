

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:varens/views/home.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class RouteGenerator {
  static Route<dynamic> onRouteGenerate(RouteSettings settings) {
    Map<String, dynamic> routeArgs = settings.arguments != null ? settings.arguments as Map<String, dynamic> : {};
    switch(settings.name) {
      case '/dashboard':
        return CustomRoute(
            builder: (context) {
              return Home();
            },
            settings: settings);
      default:
        return CustomRoute(
            builder: (context) {
              return Scaffold();
            },
            settings: settings
        );
    }
  }
}


