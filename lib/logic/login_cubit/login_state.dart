part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final LoginModel loginModel;

  const LoginState({required this.status,required this.loginModel});

  factory LoginState.initial() => LoginState(status: LoginStatus.initial, loginModel: LoginModel.initial());

  @override
  List<Object?> get props => [status,loginModel];

  LoginState copyWith({
    LoginStatus? status,
    LoginModel? loginModel,
  }) {
    return LoginState(
      status: status ?? this.status,
      loginModel: loginModel ?? this.loginModel,
    );
  }
}
