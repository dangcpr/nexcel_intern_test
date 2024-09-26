import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable{
  final String name;
  final String phoneNumber;

  const ContactEntity({required this.name, required this.phoneNumber});

  @override
  List<Object?> get props => [name, phoneNumber];
}