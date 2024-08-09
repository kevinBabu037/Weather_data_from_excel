part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class AgentLoginEvent extends LoginEvent {
  final String email;
  final String password;

  AgentLoginEvent({required this.email, required this.password});
  
}