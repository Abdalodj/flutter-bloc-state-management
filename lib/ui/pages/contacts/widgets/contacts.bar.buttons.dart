import 'package:bloc_rx_app/bloc/contacts.actions.dart';
import 'package:bloc_rx_app/bloc/contacts.bloc.dart';
import 'package:bloc_rx_app/ui/pages/contacts/widgets/contacts.button.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsBarButtons extends StatelessWidget {
  const ContactsBarButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContactsButtonItem(butonLabel: 'All Contacts', contactsEvent: new LoadAllContactsEvent(),),
          ContactsButtonItem(butonLabel: 'Students', contactsEvent: new LoadStudentsEvent(),),
          ContactsButtonItem(butonLabel: 'Developers', contactsEvent: new LoadDEvelopersEvent(),),
        ],
      ),
    );
  }
}
