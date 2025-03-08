import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sports/features/home/data/models/dropDown_items.dart';

part 'get_drop_down_items_state.dart';

class GetDropDownItemsCubit extends Cubit<GetDropDownItemsState> {
  GetDropDownItemsCubit() : super(GetDropDownItemsInitial());
}
