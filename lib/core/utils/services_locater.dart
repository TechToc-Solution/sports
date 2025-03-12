import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sports/features/auth/data/repos/login_repo/login_repo_ipml.dart';
import 'package:sports/features/home/data/repos/home_rep_impl.dart';
import 'package:sports/features/home/data/repos/home_repo.dart';

import '../../features/auth/data/repos/login_repo/login_repo.dart';
import '../Api_services/api_services.dart';

final getit = GetIt.instance;

void setupLocatorServices() {
  // init Dio
  getit.registerSingleton<Dio>(Dio(BaseOptions(
      connectTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1))));
  // init API Service
  getit.registerSingleton<ApiServices>(ApiServices(getit.get<Dio>()));

  getit.registerSingleton<HomeRepo>(
    HomeRepsIpml(getit.get<ApiServices>()),
  );
  getit.registerSingleton<LoginRepo>(
    LoginRepoIpml(getit.get<ApiServices>()),
  );
}
