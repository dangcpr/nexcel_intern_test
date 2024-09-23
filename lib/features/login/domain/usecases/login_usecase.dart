import 'package:contact_list/core/resources/data_state.dart';
import 'package:contact_list/features/login/domain/entities/user.dart';

import '../repository/user_repository.dart';

class LoginUseCase {
  LoginUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  Future<DataState<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    final result = await _userRepository.login(email: email, password: password);
    return result;
  }
}