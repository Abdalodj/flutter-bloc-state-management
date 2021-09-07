import 'package:bloc_rx_app/bloc/messages/messages.actions.dart';
import 'package:bloc_rx_app/enums/enums.dart';
import 'package:bloc_rx_app/models/messages.model.dart';

class MessageState {
  List<Message> messages;
  RequestState requestState;
  String messageError;
  MessageEvent currentMessageEvent;

  MessageState(
      {this.messages,
      this.requestState,
      this.messageError,
      this.currentMessageEvent});

  MessageState.initialState():
      requestState = RequestState.NONE,
      messages = [],
      messageError = '',
      currentMessageEvent = null;
}