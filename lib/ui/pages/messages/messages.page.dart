import 'package:bloc_rx_app/bloc/messages/messages.actions.dart';
import 'package:bloc_rx_app/bloc/messages/messages.bloc.dart';
import 'package:bloc_rx_app/bloc/messages/messages.state.dart';
import 'package:bloc_rx_app/enums/enums.dart';
import 'package:bloc_rx_app/models/contact.model.dart';
import 'package:bloc_rx_app/ui/pages/messages/widgets/contact.info.widget.dart';
import 'package:bloc_rx_app/ui/pages/messages/widgets/message.form.widget.dart';
import 'package:bloc_rx_app/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:bloc_rx_app/ui/shared/circular.progress.indicator.widget.dart';
import 'package:bloc_rx_app/ui/shared/error.retry_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesPage extends StatelessWidget {
  Contact contact;

  @override
  Widget build(BuildContext context) {
    this.contact = ModalRoute.of(context).settings.arguments;
    context.read<MessagesBloc>().add(AllMessageByContactEvent(this.contact));
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: Column(
        children: [
          ContactInfoWidget(contact: this.contact),
          Expanded(
            child: BlocBuilder<MessagesBloc, MessageState>(
              builder: (context, state) {
                if (state.requestState == RequestState.LOADING) {
                  return MyCircularProgressIndicatorWidget();
                } else if(state.requestState == RequestState.ERROR) {
                  return ErrorRetryMessage(
                    errorMessage: state.messageError,
                    onAction: () {
                      context.read<MessagesBloc>().add(state.currentMessageEvent);
                    },
                  );
              } else if (state.requestState == RequestState.LOADED) {
                  return MessageListWidget(messages: state.messages);
                } else {
                  return Container();
                }
              },
            ),
          ),
          MessageFormWidget(),
        ],
      ),
    );
  }
}
