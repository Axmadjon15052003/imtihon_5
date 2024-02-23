import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/authenticated_user.dart';
import '../repository/authentication.dart';

class AuthenticateUseCase implements UseCase<AuthenticatedUserEntity, Params> {
  final AuthenticationRepository _repository;
  AuthenticateUseCase(AuthenticationRepository repository)
      : _repository = repository;
  @override
  Future<Either<Failure, AuthenticatedUserEntity>> call(Params params) async {
    if (params is GetStatusParams) {
      return _repository.getUser();
    } else if (params is SingUpParams) {
      return _repository.sing_up(params.email, params.password);
    } else if (params is LoginParams) {
      return _repository.login(params.email, params.password);
    } else {
      return throw UnimplementedError();
    }
  }
}

abstract class Params {}

class AuthenticateUseCaseResponse {}

class GetStatusParams extends Params {}

class LoginParams extends Params {
  final String email;
  final String password;
  LoginParams({
    required this.email,
    required this.password,
  });
}

class SingUpParams extends Params {
  final String email;
  final String password;

  SingUpParams({required this.email, required this.password});
}
