import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_bloc/CounterBlocExample/logic/cubit/internet_cubit.dart';
import 'package:demo_bloc/CounterBlocExample/presentation/router/app_router.dart';
import 'package:demo_bloc/CounterBlocExample/presentation/screens/home_screen.dart';
import 'package:demo_bloc/CounterBlocExample/presentation/screens/second_screen.dart';
import 'package:demo_bloc/CounterBlocExample/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}
// Anonymous Route Access
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo BlocProvider',
//       theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity),
//       home: BlocProvider<CounterCubit>(
//         create: (context) => CounterCubit(),
//         child: HomeScreen(
//           title: 'Flutter Demo Home Page',
//           color: Colors.blueAccent,
//         ),
//       ),
//     );
//   }
// }

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
          create: (context) =>
              CounterCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo BlocProvider',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        // routes: {
        //   '/': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: HomeScreen(
        //           title: 'Home Screen',
        //           color: Colors.blueAccent,
        //         ),
        //       ),
        //   '/second': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: SecondScreen(
        //           title: 'Second Screen',
        //           color: Colors.redAccent,
        //         ),
        //       ),
        //   '/third': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: ThirdScreen(
        //           title: 'Third Screen',
        //           color: Colors.greenAccent,
        //         ),
        //       )
        // },
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}

//Generated Route Access
