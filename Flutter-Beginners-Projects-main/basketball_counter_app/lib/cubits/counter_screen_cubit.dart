import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_screen_states.dart';

class CounterScreenCubit extends Cubit<CounterState> {
  CounterScreenCubit() : super(TeamACounterIncrementState());

  int teamAPoints = 0;
  int teamBPoints = 0;

  void incrementTeamACounter(int value) {
    teamAPoints += value;
    emit(TeamACounterIncrementState());
  }

  void incrementTeamBCounter(int value) {
    teamBPoints += value;
    emit(TeamBCounterIncrementState());
  }
}
