import 'package:demo_bloc/BlocArchitechtures/core/constants/strings.dart';
import 'package:demo_bloc/BlocArchitechtures/core/exceptions/route_exception.dart';
import 'package:demo_bloc/BlocArchitechtures/presentation/screens/counter_screen/counter_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String counter = 'counter';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case counter:
        return MaterialPageRoute(
            builder: (_) => CounterScreen());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
