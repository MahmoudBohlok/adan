import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api_service/dio_helper.dart';
import '../data/data_source/remote_data_source/adan_remote_data_source.dart';
import '../data/repository-impl/base_adan_repository.dart';
import '../domain/repository/base_adan_repository.dart';
import '../domain/usecase/adan_usecase.dart';
import '../presntation/cubit/AdanCubit/order_cubit.dart';

final sl = GetIt.instance;

class ServiceInjection {
  Future<void> init() async {
    // ////////////////////////////////////////////////
    sl.registerFactory(() => AdanCubit(
          sl(),
        ));
    sl.registerLazySingleton(() => AdanUseCase(sl()));
    sl.registerLazySingleton<BaseAdanRepository>(() => AdanRepositoryImp(sl()));
    sl.registerLazySingleton<BaseAdanRemoteDataSource>(
        () => AdanRemoteDataSource(sl()));

    //////////////////////////////////////////////////////////
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(
      () => sharedPreferences,
    );
    sl.registerLazySingleton<DioHelper>(
      () => DioHelperImpl(),
    );
  }
}
