import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/core/errors/failure.dart';
import 'package:sports/features/home/data/models/drop_down_items.dart';
import 'package:sports/features/home/data/repos/home_repo.dart';

part 'get_drop_down_items_state.dart';

class GetDropDownItemsCubit extends Cubit<GetDropDownItemsState> {
  GetDropDownItemsCubit(this.homeRepo) : super(GetDropDownItemsInitial());
  final HomeRepo homeRepo;
  Future<Either<Failure, List<DropDownItems>>> fetchDropDownItems(
      {required String code, String? search, bool emitState = true}) async {
    emit(GetDropDownItemsLoading());
    var data = await homeRepo.fetchDropDownItems(code: code, search: search);
    data.fold((failuer) {
      emitState ? emit(GetDropDownItemsFailuer(failuer.message)) : null;
    }, (form) async {
      emitState ? emit(GetDropDownItemsSuccess(form)) : null;
    });
    return data;
  }
}
