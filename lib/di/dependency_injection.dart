import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tip_calculator/core/data/shared_prefs.dart';
import 'package:tip_calculator/core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // //Providers
  // sl.registerFactory(
  //         () => FinishedDeliveryProvider(finishedDeliveryUseCase: sl()));
  //
  // //UseCases
  // sl.registerLazySingleton(
  //         () => FinishedDeliveryPaginationUseCase(finishedDeliveryRepository: sl()));
  //
  // //Repository
  // sl.registerLazySingleton<FinishedDeliveryRepository>(() =>
  //     FinishedDeliveryRepositoryImpl(
  //         networkInfo: sl(), finishedDeliveryRemote: sl(), finishedDeliveryLocal: sl()));
  //
  // //Data Sources
  // sl.registerLazySingleton<FinishedDeliveryRemote>(
  //         () => FinishedDeliveryRemoteImpl(client: sl()));
  // sl.registerLazySingleton<FinishedDeliveryLocal>(
  //         () => FinishedDeliveryLocalImpl());

  //Core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<LocalDataSource>(
          () => SharedPrefs(sharedPreferences: sl()));

  //External
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPref);
  sl.registerLazySingleton(() => HttpClient());

}