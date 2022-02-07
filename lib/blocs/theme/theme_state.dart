
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum VarensAppTheme {
  dark, light,
}
class ThemeState extends Equatable {
  final Color main;
  final Color mainLight;
  final Color textColor;
  final Color textDeepColor;
  final Color contBg;
  final Color mainDark;
  final Color success;
  final Color warning;
  final Color error;
  final Color secondary;
  final Color secondaryLight;
  final Color secondaryDark;
  final Color appBackground;
  final VarensAppTheme theme;
  final Color appScaffold;
  final Color white;

  ThemeState({
    required this.main,
    required this.mainLight,
    required this.contBg,
    required this.mainDark,
    required this.success,
    required this.warning,
    required this.error,
    required this.secondary,
    required this.secondaryDark,
    required this.secondaryLight,
    required this.appBackground,
    required this.textColor,
    required this.textDeepColor,
    required this.theme,
    required this.appScaffold,
    required this.white,
  });

  @override
  List<Object> get props => [];
}

class InitialAppThemeMode extends ThemeState {
  InitialAppThemeMode():super(
    appBackground: Color(0xffffffff),
    contBg: Color(0xffF9FAFF),
    main: Color(0xff0CB1A0),
    white: Color(0xffffffff),
    mainLight: Color(0xffF0FBFF),
    mainDark: Color(0xff1C5E8C),
    success: Color(0xff59C88A),
    warning: Color(0xffE2B93B),
    error: Color(0xffEB876B),
    secondary: Color(0xff666D8F),
    secondaryLight: Color(0xffB8B8B8),
    secondaryDark: Color(0xff000000),
    textColor: Color(0xff292D32),
    textDeepColor: Color(0xff000000),
    theme: VarensAppTheme.light,
    appScaffold: Color(0xffFFFFFF),
  );
}

class LightAppThemeMode extends ThemeState {
  LightAppThemeMode():super(
    appBackground: Color(0xffffffff),
    contBg: Color(0xffF9FAFF),
    main: Color(0xff0CB1A0),
    white: Color(0xffffffff),
    mainLight: Color(0xffF0FBFF),
    mainDark: Color(0xff1C5E8C),
    success: Color(0xff59C88A),
    warning: Color(0xffE2B93B),
    error: Color(0xffEB876B),
    secondary: Color(0xff666D8F),
    secondaryLight: Color(0xffB8B8B8),
    secondaryDark: Color(0xff000000),
    textColor: Color(0xff292D32),
    textDeepColor: Color(0xff000000),
    theme: VarensAppTheme.light,
    appScaffold: Color(0xffFFFFFF),
  );
}

class DarkAppThemeMode extends ThemeState {
  DarkAppThemeMode():super(
    appBackground: Color(0xff1C1C1C),
    contBg: Color(0xff242424),
    main: Color(0xff0CB1A0),
    white: Color(0xffffffff),
    mainLight: Color(0xffF0FBFF),
    mainDark: Color(0xff1C5E8C),
    success: Color(0xff59C88A),
    warning: Color(0xffE2B93B),
    error: Color(0xffEB876B),
    secondary: Color(0xff666D8F),
    secondaryLight: Color(0xffB8B8B8),
    secondaryDark: Color(0xff000000),
    textColor: Color(0xffffffff),
    textDeepColor: Color(0xffffffff),
    theme: VarensAppTheme.dark,
    appScaffold: Color(0xff222222),
  );
}


