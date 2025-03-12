import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sports/features/home/data/models/dropDown_items.dart';
import 'package:sports/features/home/data/models/fields.dart';
import 'package:sports/features/home/data/repos/home_repo.dart';

part 'get_form_state.dart';

class GetFormCubit extends Cubit<GetFormState> {
  GetFormCubit(this.homeRepo) : super(GetFormInitial());
  final HomeRepo homeRepo;
  Future fetchForm(String form_id) async {
    emit(GetFormLoading());
    var data = await homeRepo.fetchForm(form_id);
    data.fold((failuer) {
      emit(GetFormFailuer(failuer.message));
    }, (form) async {
      List<List<DropDownItems>> formDropDownList = [];
      for (var field in form) {
        if (field.dropdown != null && field.dropdown != "") {
          var dropDownItems =
              await homeRepo.fetchDropDownItems(field.dropdown!);
          dropDownItems.fold((failuer) {
            formDropDownList.add([]);
          }, (dropDown) {
            formDropDownList.add(dropDown);
          });
        } else {
          formDropDownList.add([]);
        }
      }
      emit(GetFormSuccess(form, formDropDownList));
    });
  }
}
