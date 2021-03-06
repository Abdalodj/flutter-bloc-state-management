// @dart=2.9
import 'package:bloc_rx_app/bloc/contacts.bloc.dart';
import 'package:bloc_rx_app/repositories/contacts.repo.dart';
import 'package:bloc_rx_app/ui/pages/contacts/contacts.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'bloc/contacts.state.dart';
import 'enums/enums.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactsRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ContactsBloc(
                initialState: ContactsState(
                    contacts: [],
                    errorMessage: '',
                    requestState: RequestState.NONE),
                contactsRepository: GetIt.I<ContactsRepository>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        routes: {'/contacts': (context) => ContactsPage()},
        initialRoute: '/contacts',
      ),
    );
  }
}
