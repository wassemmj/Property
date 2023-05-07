import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:property_app/data/repo/login_repo.dart';

import '../../data/Model/login_model.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  Future postLogin(String email,String password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      var ll = await LoginRepo.login(email, password);
      emit(state.copyWith(status: LoginStatus.success,loginModel: ll));
    } catch(error) {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
