// ignore_for_file: public_member_api_docs, sort_constructors_first

part of "login_bloc.dart";

class AuthenticationState  {
  final AuthenticatedUserEntity authenticatedUser;
  final AuthenticationStatus status;
  AuthenticationState({
    required this.authenticatedUser,
    required this.status,
  });

  @override
  // TODO: implement props
  List<Object> get props => [authenticatedUser, status];

  AuthenticationState copyWith({
    AuthenticatedUserEntity? authenticatedUser,
    AuthenticationStatus? status,
  }) {
    return AuthenticationState(
      authenticatedUser: authenticatedUser ?? this.authenticatedUser,
      status: status ?? this.status,
    );
  }
}

enum AuthenticationStatus { unknown, unauthenticated, authenticated }
