import 'package:dartz/dartz.dart';
import 'package:sports/features/home/data/models/dropDown_items.dart';
import 'package:sports/features/home/data/models/fields.dart';

abstract class HomeRepo {
  Future<Either<String, List<Fields>>> fetchForm(String table_id);
  Future<Either<String, List<DropDownItems>>> fetchDropDownItems(String code);
}
