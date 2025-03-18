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

  const GetFormSuccess(this.fields);
}

final class GetFormFailuer extends GetFormState {
  final String errorMessage;

  const GetFormFailuer(this.errorMessage);
}
