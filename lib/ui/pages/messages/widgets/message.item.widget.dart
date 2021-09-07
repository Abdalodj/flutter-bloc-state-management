import 'package:bloc_rx_app/models/messages.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageItemWidget extends StatelessWidget {
  Message message;

  MessageItemWidget({this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: (message.type == 'sent') ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          (message.type == 'received') ? SizedBox(width: 20,) : SizedBox(width: 0,),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(15),
              color: (message.type == 'sent') ? Color.fromARGB(20, 0, 255, 0) : Color.fromARGB(20, 0, 0, 255),
              child: Text('${message.content} (${message.date.day}/${message.date.month}/${message.date.year} - ${message.date.hour}:${message.date.minute})'),
              foregroundDecoration: BoxDecoration(
                border: Border.all(color: (message.type == 'sent') ? Colors.greenAccent: Colors.lightBlueAccent)
              ),
            ),
          ),
          (message.type == 'sent') ? SizedBox(width: 20,) : SizedBox(width: 20,),
        ],
      ),
    );
  }
} 
