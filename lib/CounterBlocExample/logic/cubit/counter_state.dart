part of 'counter_cubit.dart';

// @immutable
// abstract class CounterState {}
//
// class CounterInitial extends CounterState {
//
// }

class CounterState {
  int counterValue;
  bool? wasIncremented;

  CounterState({
    required this.counterValue,
    this.wasIncremented
  });
}