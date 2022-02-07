import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:varens/blocs/theme/theme_bloc.dart';
import 'package:varens/blocs/theme/theme_state.dart';
import 'package:varens/router.dart';
import 'package:varens/views/intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create:(context) => ThemeBloc()),
        ],
        child:  BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Varens crypto',
                debugShowCheckedModeBanner: false,
                onGenerateRoute: (RouteSettings settings) {
                  return RouteGenerator.onRouteGenerate(settings);
                },
                onUnknownRoute: (RouteSettings settings) {
                  return RouteGenerator.onRouteGenerate(settings);
                },
                theme: ThemeData(
                  primaryColor: state.main,
                  scaffoldBackgroundColor: state.appScaffold,
                  primaryColorDark: state.secondary,
                  accentColor: state.mainLight,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: Scaffold(
                  body: AppIntro(),
                ),
              );
            }
        ),
    );
  }
}
