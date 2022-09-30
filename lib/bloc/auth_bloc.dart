import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {

    /***
     * When User Presses the SignIn Button, we will send the SignInRequested
     * Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
     * */
    on<SignInRequested>((event , emit) async{
      emit(Loading());
      try{
        await authRepository.Signin(email: event.email, password: event.password);
        emit(Authenticated());
      }catch(e){
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignupRequested>((event , emit) async{
      emit(Loading());
      try{
        await authRepository.Signup(email: event.email, password: event.password);
        emit(Authenticated());
      }catch(e){
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignoutRequest>((event , emit) async{
      emit(Loading());
      try{
        await authRepository.Signout();
        emit(UnAuthenticated());
      }catch(e){
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
  }
}
