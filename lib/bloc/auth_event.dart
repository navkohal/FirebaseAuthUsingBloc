part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignInRequested extends AuthEvent{
  final String email;
  final String password;

  SignInRequested(this.email , this.password);
}


class SignupRequested extends AuthEvent{
  final String email;
  final String password;

  SignupRequested(this.email, this.password);
}

class SignoutRequest extends AuthEvent{}
