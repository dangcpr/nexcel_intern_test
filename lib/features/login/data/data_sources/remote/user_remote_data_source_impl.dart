import 'package:dio/dio.dart';

import '../../models/user.dart';
import 'user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio _dio;

  UserRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<UserModel> login({required String email, required String password}) async {
    try {
      print(_dio.options.baseUrl);
      await Future.delayed(const Duration(seconds: 1));
      return UserModel(email: email, name: 'John Doe', id: '123');
    } catch (e) {
      rethrow;
    }
  }
}