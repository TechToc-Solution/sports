import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/login_repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  Future login({required String userName, required String passwrod}) async {
    emit(LoginLoading());
    var resp = await _loginRepo.login(userName, passwrod);
    resp.fold((failure) {
      emit(LoginError(errorMsg: failure.message));
    }, (user) {
      emit(LoginSuccess());
    });
  }
}
