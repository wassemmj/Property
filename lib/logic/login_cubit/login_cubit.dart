import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:property_app/core/token.dart';
import 'package:property_app/data/repo/login_repo.dart';

import '../../core/id.dart';
import '../../core/state.dart';
import '../../data/Model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  String? token;
  bool? done;

  Future postLogin(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    done = false;
    try {
      var loginModel = await LoginRepo.login(email, password);
      Token.token = loginModel['token'];
      Id.id = loginModel['user']['id'];
      Statee.id = loginModel["allowence"]['subscribtions_id'];
      print(Statee.id);
      done = true;
      emit(state.copyWith(
          status: LoginStatus.success,
          loginModel: LoginModel(
              email: loginModel["user"]['email'],
              name: loginModel["user"]['name'],
              token: loginModel["token"])));
    } catch (error) {
      done = false;
      emit(state.copyWith(status: LoginStatus.error));
    }
  }

  Future postSignup(
      String name, String email, String password, String coPassword) async {
    emit(state.copyWith(status: LoginStatus.loading));
    done = false;
    try {
      var signupModel =
          await LoginRepo.signup(name, email, password, coPassword);
      Token.token = signupModel['token'];
      Id.id = signupModel['user']['id'];
      Statee.id = signupModel["allowence"]['"subscribtions_id"'];
      done = true;
      emit(state.copyWith(
          status: LoginStatus.success,
          loginModel: LoginModel(
              email: signupModel["user"]['email'],
              name: signupModel["user"]['name'],
              token: signupModel["token"])));
    } catch (error) {
      done = false;
      emit(state.copyWith(status: LoginStatus.error));
    }
  }

  Future postLogout() async {
    emit(state.copyWith(status: LoginStatus.loading));
    done = false;
    try {
      await LoginRepo.logout();
      emit(state.copyWith(
        status: LoginStatus.success,
      ));
    } catch (error) {
      done = false;
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
