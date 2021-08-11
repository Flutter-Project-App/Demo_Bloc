import 'package:demo_bloc/CounterBlocExample/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key, this.title, this.color, this.homeScreenKey}) : super(key: key);

  final String? title;
  final Color? color;
  final GlobalKey<ScaffoldState>? homeScreenKey;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  GlobalKey<ScaffoldState> secondScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: secondScreenKey,
      appBar: AppBar(
        title: Text(widget.title.toString()),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times: '),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented!) {
                  widget.homeScreenKey?.currentState?.removeCurrentSnackBar();
                  secondScreenKey.currentState?.showSnackBar(SnackBar(
                    content: Text("Incremented"),
                    duration: Duration(milliseconds: 300),
                  ));
                } else {
                  widget.homeScreenKey?.currentState?.removeCurrentSnackBar();
                  secondScreenKey.currentState?.showSnackBar(SnackBar(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  backgroundColor: widget.color,
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    // BlocProvider.of<CounterCubit>(context).increment();
                    context.read<CounterCubit>().increment();
                  },
                  backgroundColor: widget.color,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 24,),
            MaterialButton(onPressed: () {

            },
              child: Text("Go to Third Screen", style: TextStyle(color: Colors.white)),
              color: widget.color,)
          ],
        ),
      ),
    );
  }
}
