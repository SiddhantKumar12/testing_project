import '../../data/model/otp_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}
