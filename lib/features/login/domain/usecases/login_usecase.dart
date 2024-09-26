import '../../../../core/resources/data_state.dart';
import '../entities/user.dart';
import '../repository/user_repository.dart';

class LoginUseCase {
  final UserRepository _userRepository;

  LoginUseCase(UserRepository userRepository) : _userRepository = userRepository;

  Future<DataState<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    final result = await _userRepository.login(email: email, password: password);
    return result;
  }
}