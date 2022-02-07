
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varens/blocs/theme/theme_bloc.dart';
import 'package:varens/blocs/theme/theme_event.dart';

class AppIntro extends StatefulWidget {
  @override
  _AppIntroState createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {

  @override
  void initState() {
    super.initState();
    _goHome();
    _checkAppTheme();
  }
  _checkAppTheme() async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if(_pref.containsKey('__APP_THEME_MODE__')) {
      var appTheme = _pref.get('__APP_THEME_MODE__');
      if(appTheme == 'light') {
        BlocProvider.of<ThemeBloc>(context).add(SetLightThemeEvent());
      } else {
        BlocProvider.of<ThemeBloc>(context).add(SetDarkThemeEvent());
      }
    } else {
      _pref.setString('__APP_THEME_MODE__', 'light');
      BlocProvider.of<ThemeBloc>(context).add(SetLightThemeEvent());
    }
  }

  _goHome() {
    Future.delayed(Duration(seconds: 4), () async {
      Navigator.of(context).pushNamed('/dashboard');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Center(
        widthFactor: 150,
        heightFactor: 150,
        child: Platform.isIOS ? CupertinoActivityIndicator() : RefreshProgressIndicator(),
      ),
    );
  }
}