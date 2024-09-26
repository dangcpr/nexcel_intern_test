import 'package:contact_list/features/contact/data/models/contact_model.dart';

abstract class ContactRemoteDataSource {
  Future<List<ContactModel>> getContactList();
}