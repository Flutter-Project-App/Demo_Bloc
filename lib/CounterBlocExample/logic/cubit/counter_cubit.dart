import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_bloc/CounterBlocExample/constants/enums.dart';
import 'package:demo_bloc/CounterBlocExample/logic/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // final InternetCubit internetCubit;

  CounterCubit()
      : super(CounterState(counterValue: 0));

  // CounterCubit({required this.internetCubit})
  //     : super(CounterState(counterValue: 0)) {
  //   monitorInternetCubit();
  // }

  // StreamSubscription<InternetState>? monitorInternetCubit() {
  //   internetStreamSubcription = internetCubit.stream.listen((internetState) {
  //     if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionType.Wifi) {
  //       increment();
  //     } else if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionType.Mobile) {
  //       decrement();
  //     }
  //   });
  // }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  // @override
  // Future<void> close() {
  //   internetStreamSubcription.cancel();
  //   return super.close();
  // }
}
