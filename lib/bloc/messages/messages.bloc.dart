import 'package:bloc/bloc.dart';
import 'package:bloc_rx_app/bloc/messages/messages.actions.dart';
import 'package:bloc_rx_app/bloc/messages/messages.state.dart';
import 'package:bloc_rx_app/enums/enums.dart';
import 'package:bloc_rx_app/models/messages.model.dart';
import 'package:bloc_rx_app/repositories/messages.repo.dart';
import 'package:flutter/cupertino.dart';

class MessagesBloc extends Bloc<MessageEvent, MessageState> {
  MessageRepository messageRepository;
  MessagesBloc({@required MessageState initialState, @required this.messageRepository}) : super(initialState);

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if(event is AllMessageByContactEvent) {
      yield MessageState(requestState: RequestState.LOADING, messages: state.messages, currentMessageEvent: event);
      try {
        List<Message> data = await messageRepository.messagesByContact(event.payload.id);
        yield MessageState(requestState: RequestState.LOADED, messages: data, currentMessageEvent: event);
      } catch (e) {
        yield MessageState(requestState: RequestState.ERROR, messageError: e.toString(), messages: state.messages, currentMessageEvent: event);
      }
    }
  }
}