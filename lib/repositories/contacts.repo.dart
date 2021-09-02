import 'dart:math';

import 'package:bloc_rx_app/models/contact.model.dart';

class ContactsRepository {
  Map<int, Contact> contacts = {
    1: Contact(id: 1, name: 'Mohamed', profile: 'MO', score: 1234, type: 'Student'),
    2: Contact(id: 2, name: 'Abdallah', profile: 'AL', score: 234, type: 'Student'),
    3: Contact(id: 3, name: 'Cheikh', profile: 'CH', score: 654, type: 'Developer'),
    4: Contact(id: 4, name: 'Ibrahim', profile: 'IB', score: 888, type: 'Student'),
    5: Contact(id: 5, name: 'Oumou', profile: 'OU', score: 666, type: 'Developer'),
  };
  
  Future<List<Contact>> allContacts() async {
    var future = await Future.delayed(Duration(seconds: 2));
    int rnd = new Random().nextInt(10);
    if(rnd > 3) {
      return contacts.values.toList();
    } else {
      throw new Exception("Internet Error");
    }
  }

  Future<List<Contact>> contactsByType(String type) async {
    var future = await Future.delayed(Duration(seconds: 2));
    int rnd = new Random().nextInt(10);
    if(rnd > 3) {
      return contacts.values.toList().where((element) => element.type == type);
    } else {
      new Exception("Internet Error");
    }
  }
}