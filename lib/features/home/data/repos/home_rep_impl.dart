import 'package:dartz/dartz.dart';
import 'package:sports/core/Api_services/api_services.dart';
import 'package:sports/core/Api_services/urls.dart';
import 'package:sports/core/errors/error_handler.dart';
import 'package:sports/core/errors/failure.dart';
import 'package:sports/core/utils/cache_helper.dart';

import 'package:sports/features/home/data/models/drop_down_items.dart';
import 'package:sports/features/home/data/models/fields.dart';
import 'package:sports/features/home/data/models/from_data.dart';
import 'package:sports/features/home/data/repos/home_repo.dart';

class HomeRepsIpml implements HomeRepo {
  final ApiServices apiServices;

  HomeRepsIpml(this.apiServices);

  @override
  Future<Either<Failure, List<Fields>>> fetchForm(String tableId) async {
    try {
      var data = await apiServices.get(
          endPoint:
              '${Urls.getForm}?table_id=$tableId&token=${CacheHelper.getData(key: 'token')}');

      MyFormData form = MyFormData.fromJson(data.data[0]);
      return right(form.fields ?? []);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<DropDownItems>>> fetchDropDownItems(
      String code) async {
    try {
      var data = await apiServices.get(
          endPoint:
              '${Urls.getDropDownData}?code=$code&token=${CacheHelper.getData(key: 'token')}&limit=10&search=');
      List<DropDownItems> items = [];
      for (var item in data.data as List) {
        items.add(DropDownItems.fromJson(item as Map<String, dynamic>));
      }

      return right(items);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
