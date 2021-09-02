import 'package:bloc_rx_app/enums/enums.dart';
import 'package:bloc_rx_app/models/contact.model.dart';

import 'contacts.actions.dart';

class ContactsState{
  List<Contact> contacts;
  RequestState requestState;
  String errorMessage;
  ContactsEvent currentEvent;

  ContactsState({this.contacts, this.requestState, this.errorMessage, this.currentEvent});
}