import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/login/data/data_sources/remote/user_remote_data_source.dart';
import 'features/login/data/data_sources/remote/user_remote_data_source_impl.dart';
import 'features/login/data/repository/user_repository_impl.dart';
import 'features/login/domain/repository/user_repository.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() {
  Dio dio = Dio();

  getIt.registerSingleton<Dio>(dio);

  getIt.registerSingleton<UserRemoteDataSource>(UserRemoteDataSourceImpl(dio: getIt()));

  getIt.registerSingleton<UserRepository>(UserRepositoryImpl(userRemoteDataSource: getIt()));

  return Future.value();
}