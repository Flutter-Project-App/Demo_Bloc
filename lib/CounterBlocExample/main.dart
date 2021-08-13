import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_bloc/CounterBlocExample/logic/cubit/internet_cubit.dart';
import 'package:demo_bloc/CounterBlocExample/logic/cubit/settings_cubit.dart';
import 'package:demo_bloc/CounterBlocExample/presentation/router/app_router.dart';
import 'package:demo_bloc/CounterBlocExample/presentation/screens/home_screen.dart';
import 'package:demo_bloc/CounterBlocExample/presentation/screens/second_screen.dart';
import 'package:demo_bloc/CounterBlocExample/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/cubit/counter_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

// Named Route Access
class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({
    Key? key,
    required this.appRouter,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo BlocProvider',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

//Generated Route Access
