// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {
  const Failure();
}

class ServerFailure extends Failure {
  final String message;
  final int code;
  ServerFailure({
    this.message = "",
    this.code = 0,
  });
}

class CatchFailure extends Failure {
  final String message;
  final int code;
  CatchFailure({
    this.message = "",
    this.code = 0,
  });
}
