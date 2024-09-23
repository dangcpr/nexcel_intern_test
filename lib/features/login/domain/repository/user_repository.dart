import 'package:contact_list/core/resources/data_state.dart';
import 'package:contact_list/features/login/domain/entities/user.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> login({required String email, required String password});
}