import 'package:demo_bloc/CounterBlocExample/constants/enums.dart';
import 'package:demo_bloc/CounterBlocExample/logic/cubit/counter_cubit.dart';
import 'package:demo_bloc/CounterBlocExample/logic/cubit/internet_cubit.dart';
import 'package:demo_bloc/CounterBlocExample/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.title, this.color}) : super(key: key);

  final String? title;
  final Color? color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title.toString()),
//       ),
//       body: BlocListener<CounterCubit, CounterState>(
//         listener: (context, state) {
//           if (state.wasIncremented!) {
//             Scaffold.of(context).showSnackBar(
//               SnackBar(content: Text("Incremented"),
//               duration: Duration(milliseconds: 300),)
//             );
//           } else {
//             Scaffold.of(context).showSnackBar(
//                 SnackBar(content: Text("Decremented"),
//                   duration: Duration(milliseconds: 300),)
//             );
//           }
//         },
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('You have pushed the button this many times: '),
//               BlocBuilder<CounterCubit, CounterState>(
//                 builder: (context, state) {
//                   if (state.counterValue < 0) {
//                     return Text(
//                       'BRR, NEGATIVE ' + state.counterValue.toString(),
//                       style: Theme.of(context).textTheme.headline4,
//                     );
//                   } else if (state.counterValue % 2 == 0) {
//                     return Text(
//                       'YAAAY ' + state.counterValue.toString(),
//                       style: Theme.of(context).textTheme.headline4,
//                     );
//                   } else if (state.counterValue == 5) {
//                     return Text(
//                       'HMM, NUMBER 5',
//                       style: Theme.of(context).textTheme.headline4,
//                     );
//                   }
//                   return Text(
//                     state.counterValue.toString(),
//                     style: Theme.of(context).textTheme.headline4,
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   FloatingActionButton(
//                     onPressed: () {
//                       BlocProvider.of<CounterCubit>(context).decrement();
//                       // context.bloc<CounterCubit>().decrement();
//                     },
//                     tooltip: 'Decrement',
//                     child: Icon(Icons.remove),
//                   ),
//                   FloatingActionButton(
//                     onPressed: () {
//                       // BlocProvider.of<CounterCubit>(context).increment();
//                       context.read<CounterCubit>().increment();
//                     },
//                     tooltip: 'Increment',
//                     child: Icon(Icons.add),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScreenKey,
      appBar: AppBar(
        title: Text(widget.title.toString()),
        backgroundColor: widget.color,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              icon: Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Wifi) {
                return Text(
                  'Wi-fi',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.green),
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Mobile) {
                return Text('Mobile',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.red));
              } else if (state is InternetDisconnected) {
                return Text("Disconnected",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.grey));
              }
              return CircularProgressIndicator();
            }),
            Divider(height: 5,),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented!) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Incremented"),
                    duration: Duration(milliseconds: 300),
                  ));
                } else {
                  homeScreenKey.currentState?.showSnackBar(SnackBar(
                    content: Text("Decremented"),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR, NEGATIVE ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAAAY ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMM, NUMBER 5',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(
              height: 24,
            ),
            Builder(builder: (context) {
              final counterState = context.watch<CounterCubit>().state;
              final internetState = context.watch<InternetCubit>().state;

              if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.Wifi) {
                return Text(
                  "Counter: " +
                      counterState.counterValue.toString() +
                      " Internet: Wifi",
                  style: Theme.of(context).textTheme.headline6,
                );
              } else if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.Wifi) {
                return Text(
                  "Counter: " +
                      counterState.counterValue.toString() +
                      " Internet: Mobile",
                  style: Theme.of(context).textTheme.headline6,
                );
              } else {
                return Text(
                  "Counter: " +
                      counterState.counterValue.toString() +
                      " Internet: Disconnected",
                  style: Theme.of(context).textTheme.headline6,
                );
              }
            }),
            SizedBox(
              height: 24,
            ),
            Builder(builder: (context) {
              final counterValue = context
                  .select((CounterCubit cubit) => cubit.state.counterValue);
              return Text(
                "Counter: " + counterValue.toString(),
                style: Theme.of(context).textTheme.headline6,
              );
            }),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                  heroTag: 'decrement',
                ),
                FloatingActionButton(
                  onPressed: () {
                    // BlocProvider.of<CounterCubit>(context).increment();
                    context.read<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  heroTag: 'increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Builder(
                builder: (materialButtonContext) => MaterialButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (_) => BlocProvider.value(
                        //       value: BlocProvider.of<CounterCubit>(context),
                        //       child: SecondScreen(
                        //             title: 'Second Screen',
                        //             color: Colors.redAccent,
                        //           ),
                        //     )));
                        Navigator.of(materialButtonContext)
                            .pushNamed('/second', arguments: homeScreenKey);
                      },
                      child: Text("Go to Second Screen",
                          style: TextStyle(color: Colors.white)),
                      color: Colors.redAccent,
                    )),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: Text(
                "Go to Third Screen",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.greenAccent,
            )
          ],
        ),
      ),
    );
  }
}
