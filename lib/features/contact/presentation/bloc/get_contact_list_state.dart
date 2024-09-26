import '../../domain/entities/contact.dart';

abstract class GetContactListState {}

class GetContactListInitial extends GetContactListState {}

class GetContactListLoading extends GetContactListState {}

class GetContactListSuccess extends GetContactListState {
  final List<ContactEntity> contactList;

  GetContactListSuccess({required this.contactList});
}

class GetContactListFailure extends GetContactListState {
  final Object? message;

  GetContactListFailure({required this.message});
}