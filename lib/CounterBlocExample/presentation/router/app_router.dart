import 'package:demo_bloc/CounterBlocExample/logic/cubit/counter_cubit.dart';
import 'package:demo_bloc/CounterBlocExample/presentation/screens/home_screen.dart';
import 'package:demo_bloc/CounterBlocExample/presentation/screens/second_screen.dart';
import 'package:demo_bloc/CounterBlocExample/presentation/screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings settings) {
    final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomeScreen(
                  title: 'HomeScreen',
                  color: Colors.blueAccent,
                ));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => SecondScreen(
                  title: 'SecondScreen',
                  color: Colors.redAccent,
              homeScreenKey: key,
                ));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => ThirdScreen(
                  title: 'ThirdScreen',
                  color: Colors.greenAccent,
                ));
      default:
        return null;
    }
  }
}
