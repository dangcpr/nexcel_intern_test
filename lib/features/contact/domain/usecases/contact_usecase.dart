import '../../../../core/resources/data_state.dart';
import '../entities/contact.dart';
import '../repository/contact_respository.dart';

class ContactUseCase {
  final ContactRepository _contactRespository;

  const ContactUseCase(ContactRepository contactRespository) : _contactRespository = contactRespository;

  Future<DataState<List<ContactEntity>>> getContactList() async {
    final result = await _contactRespository.getContactList();
    return result;
  }
}