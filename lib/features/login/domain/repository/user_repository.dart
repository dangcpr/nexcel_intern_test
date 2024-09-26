import '../../../../core/resources/data_state.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> login({required String email, required String password});
}