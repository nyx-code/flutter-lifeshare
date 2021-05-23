part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AppAuth extends AuthState {}

class AppUnAuth extends AuthState {}

class AppLoading extends AuthState {}

class PinCodeCorrect extends AuthState {}

class PinCodeWrong extends AuthState {}

class PinCodeSet extends AuthState {}

class IsPinCodeAvailabel extends AuthState {
  final bool isPinCode;

  IsPinCodeAvailabel({this.isPinCode});
}
