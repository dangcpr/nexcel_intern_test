import '../../../../core/resources/data_state.dart';
import '../../data/data_sources/remote/user_remote_data_source.dart';
import '../../data/models/user.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl({required UserRemoteDataSource userRemoteDataSource})
      : _userRemoteDataSource = userRemoteDataSource;

  @override
  Future<DataState<UserModel>> login({required String email, required String password}) async {
    try {
      final user = await _userRemoteDataSource.login(email: email, password: password);
      return DataStateSuccess(user);
    } catch (e) {
      return DataStateException(e);
    }
  }
}