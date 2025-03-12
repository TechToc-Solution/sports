import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/login_repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  Future login({required String userName, required String passwrod}) async {
    emit(LoginLoading());
    var resp = await _loginRepo.login(userName, passwrod);
    resp.fold((error) {
      emit(LoginError(errorMsg: error));
    }, (user) {
      emit(LoginSuccess());
    });
  }
}
