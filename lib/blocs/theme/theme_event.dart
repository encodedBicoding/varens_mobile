
import 'package:equatable/equatable.dart';

class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SetLightThemeEvent extends ThemeEvent {}
class SetDarkThemeEvent extends ThemeEvent {}
