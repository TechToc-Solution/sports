part of 'get_form_cubit.dart';

sealed class GetFormState extends Equatable {
  const GetFormState();

  @override
  List<Object> get props => [];
}

final class GetFormInitial extends GetFormState {}

final class GetFormLoading extends GetFormState {}

final class GetFormSuccess extends GetFormState {
  final List<Fields> fields;
  final List<List<DropDownItems>> dropDownLists;

  const GetFormSuccess(this.fields, this.dropDownLists);
}

final class GetFormFailuer extends GetFormState {
  final String errorMessage;

  const GetFormFailuer(this.errorMessage);
}
