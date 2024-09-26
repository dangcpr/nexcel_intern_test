import 'package:contact_list/features/contact/domain/entities/contact.dart';

class ContactModel extends ContactEntity {
  const ContactModel({
    required super.name,
    required super.phoneNumber,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
}