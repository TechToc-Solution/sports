import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:sports/core/Api_services/api_services.dart';
import 'package:sports/core/Api_services/urls.dart';
import 'package:sports/core/errors/ExceptionsHandle.dart';

import 'package:sports/features/home/data/models/dropDown_items.dart';
import 'package:sports/features/home/data/models/fields.dart';
import 'package:sports/features/home/data/models/from_data.dart';
import 'package:sports/features/home/data/repos/home_repo.dart';

class HomeRepsIpml implements HomeRepo {
  final ApiServices apiServices;
  String token = "1ae99c40-9976-4bac-ab91-53499e9203b3";
  HomeRepsIpml(this.apiServices);

  @override
  Future<Either<String, List<Fields>>> fetchForm(String table_id) async {
    try {
      var data = await apiServices.get(
          endPoint: '${Urls.getForm}?table_id=$table_id&token=$token');

      MyFormData form = MyFormData.fromJson(data.data[0]);
      return right(form.fields ?? []);
    } catch (e) {
      if (e is DioException) {
        return left(exceptionsHandle(error: e));
      }
      return left("An unexpected error occurred: ${e.toString()}");
    }
  }

  @override
  Future<Either<String, List<DropDownItems>>> fetchDropDownItems(
      String code) async {
    try {
      var data = await apiServices.get(
          endPoint: '${Urls.GetDropDownData}?code=$code&token=$token');
      List<DropDownItems> items = [];
      for (var item in data.data as List) {
        items.add(DropDownItems.fromJson(item as Map<String, dynamic>));
      }

      return right(items);
    } catch (e) {
      if (e is DioException) {
        return left(exceptionsHandle(error: e));
      }
      return left("error");
    }
  }
}
