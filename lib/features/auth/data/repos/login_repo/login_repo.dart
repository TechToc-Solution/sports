import 'package:dartz/dartz.dart';
import 'package:sports/core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, String>> login(String pass, String phone);
}
