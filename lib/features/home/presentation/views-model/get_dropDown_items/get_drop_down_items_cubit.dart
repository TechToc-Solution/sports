import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/features/home/data/models/drop_down_items.dart';

part 'get_drop_down_items_state.dart';

class GetDropDownItemsCubit extends Cubit<GetDropDownItemsState> {
  GetDropDownItemsCubit() : super(GetDropDownItemsInitial());
}
