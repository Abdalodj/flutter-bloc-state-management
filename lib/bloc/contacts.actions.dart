

import 'package:bloc_rx_app/enums/enums.dart';
import 'package:bloc_rx_app/models/contact.model.dart';

abstract class ContactsEvent {}

class LoadAllContactsEvent extends ContactsEvent {}

class LoadStudentsEvent extends ContactsEvent{}

class LoadDEvelopersEvent extends ContactsEvent{}
