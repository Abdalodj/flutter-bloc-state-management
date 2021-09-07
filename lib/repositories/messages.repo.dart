import 'dart:math';

import 'package:bloc_rx_app/models/messages.model.dart';

class MessageRepository {
  Map<int, Message> messages = {
    1: Message(id: 1, contactId: 1, date: DateTime.now(), content: 'Hello Mouhamed , ljlhlhkshflksdhfsfsqfdsklj skjdqhfqlksjdf  lsqf hlsq df', type: 'sent'),
    2: Message(id: 2, contactId: 1, date: DateTime.now(), content: "Hi, bro", type: 'received'),
    3: Message(id: 3, contactId: 1, date: DateTime.now(), content: 'What are you doing', type: 'sent'),
    4: Message(id: 4, contactId: 1, date: DateTime.now(), content: 'Everything sounds good, ljlhlhkshflksdhfsfsqfdsklj skjdqhfqlksjdf  lsqf hlsq df', type: 'received'),
    5: Message(id: 5, contactId: 2, date: DateTime.now(), content: 'Hi Abda', type: 'sent'),
    6: Message(id: 6, contactId: 2, date: DateTime.now(), content: 'Well received', type: 'received'),
  };

  Future<List<Message>> allMessages() async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(rnd > 2) {
      return messages.values.toList();
    } else {
      throw new Exception('Internet Error');
    }
  }

  Future<List<Message>> messagesByContact(int contactId) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int rnd = new Random().nextInt(10);
    if(rnd > 2) {
      return messages.values.toList().where((item) => item.contactId == contactId).toList();
    } else {
      throw new Exception('Internet Error');
    }
  }
}