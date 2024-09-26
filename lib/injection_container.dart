import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/constants/global.dart';
import 'features/contact/data/data_sources/contact_data_source.dart';
import 'features/contact/data/data_sources/contact_data_source_impl.dart';
import 'features/contact/data/repository/contact_respository_impl.dart';
import 'features/contact/domain/repository/contact_respository.dart';
import 'features/contact/domain/usecases/contact_usecase.dart';
import 'features/contact/presentation/bloc/get_contact_list_bloc.dart';
import 'features/login/data/data_sources/remote/user_remote_data_source.dart';
import 'features/login/data/data_sources/remote/user_remote_data_source_impl.dart';
import 'features/login/data/repository/user_repository_impl.dart';
import 'features/login/domain/repository/user_repository.dart';
import 'features/login/domain/usecases/login_usecase.dart';
import 'features/login/presentation/bloc/remote/login_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );

  getIt.registerSingleton<Dio>(dio);

  getIt.registerSingleton<UserRemoteDataSource>(UserRemoteDataSourceImpl(dio: getIt()));
  getIt.registerSingleton<ContactRemoteDataSource>(ContactRemoteDataSourceImpl(dio: getIt()));

  getIt.registerSingleton<UserRepository>(UserRepositoryImpl(userRemoteDataSource: getIt()));
  getIt.registerSingleton<ContactRepository>(ContactRepositoryImpl(contactDataSource: getIt()));

  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt()));
  getIt.registerSingleton<ContactUseCase>(ContactUseCase(getIt()));

  getIt.registerSingleton<LoginBloc>(LoginBloc(getIt()));
  getIt.registerSingleton<GetContactListBloc>(GetContactListBloc(getIt()));

  return Future.value();
}