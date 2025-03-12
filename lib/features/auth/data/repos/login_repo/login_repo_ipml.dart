import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:sports/core/errors/error_handler.dart';
import 'package:sports/core/errors/failure.dart';
import 'package:sports/core/utils/cache_helper.dart';

import '../../../../../core/Api_services/api_services.dart';
import '../../../../../core/Api_services/urls.dart';
import 'login_repo.dart';

class LoginRepoIpml implements LoginRepo {
  final ApiServices apiServices;

  LoginRepoIpml(this.apiServices);
  @override
  Future<Either<Failure, String>> login(
      String userName, String password) async {
    try {
      var resp = await apiServices.get(
          endPoint:
              "${Urls.getToken}?lang=en&user_name=$userName&password=$password");
      log("token is : ${resp.data['token']}");

      CacheHelper.setString(key: 'token', value: resp.data['token']);
      log("saved token is : ${CacheHelper.getData(key: 'token')}");
      return right(resp.data['token']);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
