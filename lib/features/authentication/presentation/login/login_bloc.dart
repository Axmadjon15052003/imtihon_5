import 'package:exam_productive/features/authentication/domain/repository/authentication.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../data/data_source/remote.dart';
import '../../data/repository/authentication.dart';
import '../../domain/entity/authenticated_user.dart';
import '../../domain/usecase/authenticate.dart';

part 'login_state.dart';
part 'login_event.dart';

class AuthenticationBloc
    extends Bloc<AuthentitationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(AuthenticationState(
          status: AuthenticationStatus.unknown,
          authenticatedUser: const AuthenticatedUserEntity(
            email: "",
          ),
        )) {
    on<AuthenticationGetStatusEvent>((event, emit) async {
      final usecase = AuthenticateUseCase(
        AuthenticationRepositoryImpl(
          dataSource: AuthenticationRemoteDataSource(),
        ) as AuthenticationRepository,
      );
      final either = await usecase.call(GetStatusParams());
      either.either((failure) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }, (user) {
        emit(state.copyWith());
        emit(state.copyWith(
            status: AuthenticationStatus.authenticated,
            authenticatedUser: user));
      });
      either.either((failure) {}, (user) {});
    });
    on<AuthenticationLogoutRequestedEvent>((event, emit) async {
      final usecase = await AuthenticateUseCase(AuthenticationRepositoryImpl(
              dataSource: AuthenticationRemoteDataSource()) as AuthenticationRepository
          // emit(state.copyWith(
          //   status: AuthenticationStatus.unauthenticated,
          );
      final either = await usecase.call(GetStatusParams());
      either.either((failure) {}, (user) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      });
    });

    on<AuthenticationLoginRequestEvent>((event, emit) async {
      final usecase = AuthenticateUseCase(AuthenticationRepositoryImpl(
          dataSource: AuthenticationRemoteDataSource()) as AuthenticationRepository);
      final either = await usecase
          .call(LoginParams(email: event.email, password: event.password));
    });
    on<AuthenticationSingUpRequested>((event, emit) async {
      final usecase = await AuthenticateUseCase(AuthenticationRepositoryImpl(
          dataSource: AuthenticationRemoteDataSource()) as AuthenticationRepository);
      final either = await usecase
          .call(SingUpParams(email: event.email, password: event.password));
      either.either((failure) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }, (user) {
        emit(state.copyWith());
        emit(state.copyWith(
            authenticatedUser: user,
            status: AuthenticationStatus.authenticated));
      });
    });
  }
}
