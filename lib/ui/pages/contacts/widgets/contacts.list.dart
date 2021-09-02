import 'package:bloc_rx_app/models/contact.model.dart';
import 'package:flutter/material.dart';


class ContactsList extends StatelessWidget {
  final List<Contact> contacts;

  const ContactsList({this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(thickness: 2,),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                      child:
                      Text('${contacts[index].profile}')),
                  SizedBox(
                    width: 10,
                  ),
                  Text("${contacts[index].name}"),
                ],
              ),
              CircleAvatar(
                child: Text('${contacts[index].score}'),
              ),
            ],
          ),
        );
      },
    );
  }
}
