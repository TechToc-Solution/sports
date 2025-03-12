import 'package:dartz/dartz.dart';
import 'package:sports/core/errors/failure.dart';
import 'package:sports/features/home/data/models/drop_down_items.dart';
import 'package:sports/features/home/data/models/fields.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Fields>>> fetchForm(String tableId);
  Future<Either<Failure, List<DropDownItems>>> fetchDropDownItems(String code);
}
