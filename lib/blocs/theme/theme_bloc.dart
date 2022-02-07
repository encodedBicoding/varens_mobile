
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:varens/blocs/theme/theme_event.dart';
import 'package:varens/blocs/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc():super(InitialAppThemeMode());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async*{
    if(event is SetLightThemeEvent) {
      yield LightAppThemeMode();
    }
    if(event is SetDarkThemeEvent) {
      yield DarkAppThemeMode();
    }
  }
}