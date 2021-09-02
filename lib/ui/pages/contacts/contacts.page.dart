import 'package:bloc_rx_app/bloc/contacts.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<ContactsBloc>().add(LoadAllContactsEvent());
                  },
                  child: Text('All Contacts'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Students'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Developers'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
                  if (state.requestState == RequestState.LOADING) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state.requestState == RequestState.ERROR) {
                    return Column(
                      children: [
                        Text(
                          '${state.errorMessage}',
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ContactsBloc>().add(state.currentEvent);
                          },
                          child: Text('Retry', style: TextStyle(color: Colors.white),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                          )
                        )
                      ],
                    );
                  } else if (state.requestState == RequestState.LOADED) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.contacts.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${state.contacts[index].name}"),
                                CircleAvatar(
                                  child: Text('${state.contacts[index].score}'),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
