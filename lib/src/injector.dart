import 'package:get_it/get_it.dart';
import 'package:tokens/src/core/contants/db_constants.dart';
import 'package:tokens/src/core/network/network_manager.dart';
import 'package:tokens/src/data/datasources/local/app_database.dart';
import 'package:tokens/src/data/datasources/remote/remote_data_source.dart';
import 'package:tokens/src/data/repositories/token_repositort_impl.dart';
import 'package:tokens/src/domain/repositories/token_repository.dart';
import 'package:tokens/src/domain/usecases/delete_alert_token.dart';
import 'package:tokens/src/domain/usecases/get_all_alert_tokens.dart';
import 'package:tokens/src/domain/usecases/get_all_tokens.dart';
import 'package:tokens/src/domain/usecases/get_token_details.dart';
import 'package:tokens/src/domain/usecases/insert_alert_token.dart';
import 'package:tokens/src/presentation/bloc/alerts/alerts_bloc.dart';
import 'package:tokens/src/presentation/bloc/token/token_bloc.dart';
import 'package:tokens/src/presentation/bloc/token_detail/token_detail_bloc.dart';

final injector = GetIt.instance;

Future<void> init() async {
  // DB
  final database = await $FloorAppDatabase
      .databaseBuilder(DBConstants.kDatabaseName)
      .build();

  injector.registerSingleton<AppDatabase>(database);

  // bloc
  injector.registerFactory(() => TokenBloc(injector()));
  injector.registerFactory(() => TokenDetailBloc(injector()));
  injector
      .registerFactory(() => AlertsBloc(injector(), injector(), injector()));

  // usecase
  injector.registerLazySingleton(() => GetAllTokens(injector()));
  injector.registerLazySingleton(() => GetTokenDetails(injector()));
  injector.registerLazySingleton(() => InsertAlertToken(injector()));
  injector.registerLazySingleton(() => GetAllAlertTokens(injector()));
  injector.registerLazySingleton(() => DeleteAlertToken(injector()));

  // repository
  injector.registerLazySingleton<TokenRepository>(
    () => TokenRepositoryImpl(
      remoteDataSource: injector(),
      appDatabase: injector(),
    ),
  );

  // data source
  injector.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(networkManager: injector()),
  );

  //network
  injector.registerLazySingleton(() => NetworkManager());
}
