import '../../../../core/resources/data_state.dart';
import '../entities/contact.dart';

abstract class ContactRespository {
  Future<DataState<ContactEntity>> getContactList();
}