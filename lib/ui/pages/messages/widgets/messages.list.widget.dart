import 'package:bloc_rx_app/models/messages.model.dart';
import 'package:bloc_rx_app/ui/pages/messages/widgets/message.item.widget.dart';
import 'package:flutter/material.dart';
class MessageListWidget extends StatelessWidget {
  List<Message> messages;


  MessageListWidget({this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => MessageItemWidget(message: messages[index],),
        separatorBuilder: (context, index) => Divider(
          color: Colors.amber,
          height: 2,
        ),
        itemCount: messages.length);
  }
}
