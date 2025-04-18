import 'package:flutter_bloc/flutter_bloc.dart';

// События
abstract class TaskEvent {}

class AddTask extends TaskEvent {
  final String task;
  AddTask(this.task);
}

// Состояния
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskAdded extends TaskState {
  final String task;
  TaskAdded(this.task);
}

// BLoC для задач
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is AddTask) {
      yield TaskAdded(event.task);
    }
  }
}
