import '../../data/data_sources/contact_data_source.dart';
import 'package:dio/dio.dart';

import '../models/contact_model.dart';

class ContactRemoteDataSourceImpl implements ContactRemoteDataSource {
  final Dio _dio;

  ContactRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<ContactModel>> getContactList() async {
    try {
      print(_dio.options.baseUrl);
      await Future.delayed(const Duration(seconds: 1));
      return [
        const ContactModel(name: 'John Doe', phoneNumber: '1234567890'),
        const ContactModel(name: 'Jane Doe', phoneNumber: '2134567890'),
      ];
    } catch (e) {
      rethrow;
    }
  }
}