import '../../../../core/resources/data_state.dart';
import '../entities/contact.dart';

abstract class ContactRepository {
  Future<DataState<List<ContactEntity>>> getContactList();
}