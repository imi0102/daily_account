/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 11/01/24
 */
import 'package:daily_account/features/data/data_sources/add_data_api_services.dart';
import 'package:daily_account/features/data/repositories/add_data_repository_impl.dart';
import 'package:daily_account/features/domain/repositories/add_data_repository.dart';
import 'package:daily_account/features/domain/use_cases/add_data_use_case.dart';
import 'package:daily_account/features/presentation/blocs/add_data_bloc/add_data_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> injectionContainer() async {
  //*** Data ***//
  serviceLocator.registerSingleton<AddDataApiServices>(
    AddDataApiServicesImpl(),
  );
  //*** Repo ***//
  serviceLocator.registerSingleton<AddDataRepository>(
      AddDataRepositoryImpl(serviceLocator<AddDataApiServices>()));
  serviceLocator
      .registerSingleton<AddDataUseCase>(AddDataUseCase(serviceLocator()));
  //*** Bloc ***//
  serviceLocator.registerFactory<AddDataBloc>(
      () => AddDataBloc(serviceLocator<AddDataUseCase>()));

  // //*** Bloc ***//
  // serviceLocator.registerFactory<PassbookBloc>(() => PassbookBloc(serviceLocator<PassbookUseCases>()));
  // serviceLocator.registerFactory<AdsBloc>(() => AdsBloc());
}
