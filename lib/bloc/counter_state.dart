// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CounterState {}

class initialState extends CounterState {}

class TheNumberHasBeenChange extends CounterState {
  int counter;
  TheNumberHasBeenChange({
    required this.counter,
  });
}

class RestoreToZero extends CounterState {
  int counter = 0;
}

class UserInputAlphabetToCounter extends CounterState {
  int counter;
  UserInputAlphabetToCounter({
    required this.counter,
  });
}

// class RestartTextField extends CounterState {
//   int counter = 0;
// }
