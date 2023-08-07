import 'package:flutter_bloc/flutter_bloc.dart';

enum TimeContainerState { notClicked, clicked }

class WaktuCubit extends Cubit<List<TimeContainerState>> {
  WaktuCubit()
      : super([
          TimeContainerState.notClicked,
          TimeContainerState.notClicked,
          TimeContainerState.notClicked,
          TimeContainerState.notClicked,
          TimeContainerState.notClicked,
          TimeContainerState.notClicked,
          TimeContainerState.notClicked,
          TimeContainerState.notClicked,
        ]);

  void setTimeClicked(int index) {
    if (index < 0 || index >= state.length) {
      // Handle index out of range to prevent errors
      return;
    }

    List<TimeContainerState> newState = List.from(state);

    // Reset previously clicked container to notClicked state
    int clickedIndex = newState.indexOf(TimeContainerState.clicked);
    if (clickedIndex != -1) {
      newState[clickedIndex] = TimeContainerState.notClicked;
    }

    // Set the clicked container to clicked state
    newState[index] = TimeContainerState.clicked;
    emit(newState);
  }
}
