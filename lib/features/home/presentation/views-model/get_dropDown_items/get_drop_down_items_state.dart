part of 'get_drop_down_items_cubit.dart';

sealed class GetDropDownItemsState extends Equatable {
  const GetDropDownItemsState();

  @override
  List<Object> get props => [];
}

final class GetDropDownItemsInitial extends GetDropDownItemsState {}

final class GetDropDownItemsLoading extends GetDropDownItemsState {}

final class GetDropDownItemsSuccess extends GetDropDownItemsState {
  final List<DropDownItems> items;

  const GetDropDownItemsSuccess(this.items);
}

final class GetDropDownItemsFailuer extends GetDropDownItemsState {
  final String errorMessage;

  const GetDropDownItemsFailuer(this.errorMessage);
}
