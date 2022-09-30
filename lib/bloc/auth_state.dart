part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}


/*** when user presses on login or Signup btn ,
     state will first changed to loading state and then to Authenticated State
 ***/
class Loading extends AuthState{
  @override
  List<Object?> get props => [];
}

/**
 When  user is authenticated , then State is chnaged to Authenticated State
 **/
class Authenticated extends AuthState{
  @override
  List<Object?> get props => [];
}

/**
    this is the initial state of the bloc , if
    user is not authenticated , then the state will change to UnAuthenticated State
 **/
class UnAuthenticated extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


/***
 * If any error occures , the state will change to AuthError state
 * **/
class AuthError extends AuthState{
 final String error;

 AuthError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}



