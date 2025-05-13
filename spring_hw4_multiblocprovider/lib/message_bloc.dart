import 'package:flutter_bloc/flutter_bloc.dart';

// Event
abstract class MessageEvent {}

class UpdateMessage extends MessageEvent {
  final String newMessage;
  UpdateMessage(this.newMessage);
}

// Bloc
class MessageBloc extends Bloc<MessageEvent, String> {
  MessageBloc() : super("Initial Message") {
    on<UpdateMessage>((event, emit) {
      emit(event.newMessage);
    });
  }
}
