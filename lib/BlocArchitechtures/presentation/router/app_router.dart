import 'package:demo_bloc/BlocArchitechtures/core/constants/strings.dart';
import 'package:demo_bloc/BlocArchitechtures/core/exceptions/route_exception.dart';
import 'package:demo_bloc/BlocArchitechtures/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(title: Strings.homeScreenTitle));
      default:
        throw const RouteException('Route not found!');
    }
  }
}
