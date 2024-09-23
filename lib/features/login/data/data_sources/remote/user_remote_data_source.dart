import '../../models/user.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
}