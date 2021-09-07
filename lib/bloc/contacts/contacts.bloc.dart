import 'package:bloc/bloc.dart';
import 'package:bloc_rx_app/enums/enums.dart';
import 'package:bloc_rx_app/models/contact.model.dart';
import 'package:bloc_rx_app/repositories/contacts.repo.dart';

import 'contacts.actions.dart';
import 'contacts.state.dart';


class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsRepository contactsRepository;

  ContactsBloc({ContactsState initialState, this.contactsRepository}) : super(initialState);


  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if(event is LoadAllContactsEvent) {
      yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, currentEvent: event);
      try {
        List<Contact> data = await contactsRepository.allContacts();
        yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentEvent: event);
      } catch (e) {
        yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.message, currentEvent: event);
      }
    } else if(event is LoadStudentsEvent) {
      yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, currentEvent: event);
      try {
        List<Contact> data = await contactsRepository.contactsByType('Student');
        yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentEvent: event);
      } catch (e) {
        yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.message, currentEvent: event);
      }
    } else if(event is LoadDEvelopersEvent) {
      yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, currentEvent: event);
      try {
        List<Contact> data = await contactsRepository.contactsByType('Developer');
        yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentEvent: event);
      } catch (e) {
        yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.message, currentEvent: event);
      }
    }
  }

}