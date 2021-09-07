import 'package:bloc_rx_app/bloc/contacts/contacts.actions.dart';
import 'package:bloc_rx_app/bloc/contacts/contacts.bloc.dart';
import 'package:bloc_rx_app/bloc/contacts/contacts.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ContactsButtonItem extends StatelessWidget {
  final String butonLabel;
  final ContactsEvent contactsEvent;


  ContactsButtonItem({this.butonLabel, this.contactsEvent});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
          decoration: BoxDecoration(
              border: Border.all(
                  width: (state.currentEvent.runtimeType == contactsEvent.runtimeType) ? 2 : 0,
                  color: Colors.amberAccent
              )
          ),
          child: ElevatedButton(
            onPressed: () {
              context.read<ContactsBloc>().add(contactsEvent);
            },
            child: Text(butonLabel),
          ),
        );
      },
    );
  }
}
