import 'package:bloc_rx_app/models/contact.model.dart';
import 'package:bloc_rx_app/models/messages.model.dart';

abstract class MessageEvent<T>{
  T payload;

  MessageEvent(this.payload);
}

class AllMessageByContactEvent extends MessageEvent<Contact> {
  AllMessageByContactEvent(Contact payload) : super(payload);
}

class AddNewMessageEvent extends MessageEvent<Message> {
  AddNewMessageEvent(Message payload) : super(payload);
}