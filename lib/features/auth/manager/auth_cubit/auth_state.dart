import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthState {}

class AuthenticationLoading extends AuthState {}

class AuthenticationSuccess extends AuthState {
  final User? user;

  const AuthenticationSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthenticationSuccessOwner extends AuthenticationSuccess {
  const AuthenticationSuccessOwner(User? user) : super(user);
}

class AuthenticationSuccessUser extends AuthenticationSuccess {
  const AuthenticationSuccessUser(User? user) : super(user);
}

class AuthenticationFailure extends AuthState {
  final String error;

  const AuthenticationFailure({required this.error});

  @override
  List<Object?> get props => [error];
}