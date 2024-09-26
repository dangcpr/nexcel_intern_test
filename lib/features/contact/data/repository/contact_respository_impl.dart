import '../../../../core/resources/data_state.dart';
import '../../domain/repository/contact_respository.dart';
import '../data_sources/contact_data_source.dart';
import '../models/contact_model.dart';

class ContactRepositoryImpl extends ContactRepository {
  final ContactRemoteDataSource _contactDataSource;

  ContactRepositoryImpl({required ContactRemoteDataSource contactDataSource})
      : _contactDataSource = contactDataSource;

  @override
  Future<DataState<List<ContactModel>>> getContactList() async {
    try {
      final contactList = await _contactDataSource.getContactList();
      return DataStateSuccess(contactList);
    } catch (e) {
      return DataStateException(e);
    }
  }
}