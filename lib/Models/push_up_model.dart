import 'package:flutter_bloc/flutter_bloc.dart';

enum ExerciseState { neutral, init, complete }

class ExerciseCounter extends Cubit<ExerciseState> {
  ExerciseCounter() : super(ExerciseState.neutral);
  int counter = 0;

  void setExerciseState(ExerciseState current) {
    emit(current);
  }

  void increment() {
    counter++;
    emit(state);
  }

  void reset() {
    counter = 0;
    emit(state);
  }
}
