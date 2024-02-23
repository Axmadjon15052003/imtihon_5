// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServerExcaption implements Exception {
  final String message;
  final int code;
  ServerExcaption({
    required this.message,
    required this.code,
  });
}
