import 'package:demo_bloc/BlocArchitechtures/core/constants/strings.dart';
import 'package:demo_bloc/BlocArchitechtures/core/themes/app_theme.dart';
import 'package:demo_bloc/BlocArchitechtures/logic/debug/app_bloc_observer.dart';
import 'package:demo_bloc/BlocArchitechtures/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
