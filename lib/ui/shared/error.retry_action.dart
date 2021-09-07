import 'package:bloc_rx_app/bloc/contacts/contacts.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorRetryMessage extends StatelessWidget {
  final String errorMessage;
  final Function onAction;

  const ErrorRetryMessage({this.errorMessage, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$errorMessage',
        ),
        ElevatedButton(
          onPressed: onAction,
          child: Text(
            'Retry',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepOrange),
          ),
        ),
      ],
    );
  }
}
