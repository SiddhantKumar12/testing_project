part of 'otp_cubit.dart';

abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoadingState extends OtpState {}

class OtpLoadedState extends OtpState {}

class OtpErrorState extends OtpState {
  final String error;
  OtpErrorState(this.error);
}
