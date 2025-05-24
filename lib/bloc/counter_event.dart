// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CounterEvent {}


class Increament extends CounterEvent {}

class Decreament extends CounterEvent {}

class Restore extends CounterEvent {}

class SetTheNumberFromTextField extends CounterEvent {
  String theNumber;
  SetTheNumberFromTextField({
    required this.theNumber,
  });
}
