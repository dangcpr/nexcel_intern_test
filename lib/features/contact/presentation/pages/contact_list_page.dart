import 'package:contact_list/features/contact/presentation/bloc/get_contact_list_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/get_contact_list_bloc.dart';
import '../bloc/get_contact_list_state.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetContactListBloc>(context).add(GetContactListRequested());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: BlocBuilder<GetContactListBloc, GetContactListState>(
        builder: (context, state) {
          if (state is GetContactListInitial) {
            return const Center(
              child: SizedBox(),
            );
          }

          if (state is GetContactListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is GetContactListSuccess) {
            return ListView.builder(
              itemCount: state.contactList.length,
              itemBuilder: (context, index) {
                final contact = state.contactList[index];
                return ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.phoneNumber),
                );
              },
            );
          }

          if (state is GetContactListFailure) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }

          return const SizedBox.shrink();
        },
      )
    );
  }
}