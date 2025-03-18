import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/features/home/data/models/drop_down_items.dart';
import 'package:sports/features/home/data/repos/home_repo.dart';

part 'get_drop_down_items_state.dart';

class GetDropDownItemsCubit extends Cubit<GetDropDownItemsState> {
  GetDropDownItemsCubit(this.homeRepo) : super(GetDropDownItemsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchDropDownItems(String code) async {
    emit(GetDropDownItemsLoading());
    var data = await homeRepo.fetchDropDownItems(code);
    data.fold((failuer) {
      emit(GetDropDownItemsFailuer(failuer.message));
    }, (form) async {
      emit(GetDropDownItemsSuccess(form));
    });
  }
}
