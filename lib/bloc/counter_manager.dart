

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc4/bloc/counter_event.dart';
import 'package:intro_to_bloc4/bloc/counter_state.dart';

class CounterManager extends Bloc<CounterEvent,CounterState>{
  int counter =0;
  CounterManager():super(initialState()){
    on<Increament>((event, emit) {
      counter++;
      print("object");
      emit(TheNumberHasBeenChange(counter: counter));
    },);

    on<Decreament>((event, emit) {
      counter--;
      print("new obejec");
      emit(TheNumberHasBeenChange(counter: counter));
    },);

    on<Restore>((event, emit) {
      counter=0;
      emit(RestoreToZero());
    },);

    on<SetTheNumberFromTextField>((event, emit) {
      // TODO: 
      int? temp = int.tryParse(event.theNumber);
      if (temp == null) {
        
        emit(UserInputAlphabetToCounter(counter: counter));
      }else {
      counter= temp;
      emit(TheNumberHasBeenChange(counter: counter));

      }
    },);
  }
}