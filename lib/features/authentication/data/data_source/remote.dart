import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/exception/exception.dart';

abstract class AuthenticationRemoteDataSource {
  Future<User> getUser();
  Future<User> login(String email, String password);
  Future<User> sing_up(String email, String password);
  Future<void> logout();
  factory AuthenticationRemoteDataSource() =>
      _AuthenticationRemoteDataSourceImpl();
}

class _AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  @override
  Future<User> getUser() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        throw ServerExcaption(message: "Foydalanuvchi yoq", code: 140);
      }
      return FirebaseAuth.instance.currentUser!;
    } on ServerExcaption {
      rethrow;
    } catch (error) {
      throw ServerExcaption(
        message: "$error",
        code: 400,
      );
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return await getUser();
    } on ServerExcaption {
      rethrow;
    } catch (error) {
      throw ServerExcaption(message: "$error", code: 500);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ServerExcaption(message: "chiqib bo'lmaydi", code: 400);
    }
  }

  @override
  Future<User> sing_up(String email, String password) async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return FirebaseAuth.instance.currentUser!;
    } catch (e) {
      throw ServerExcaption(message: "message", code: 500);
    }
  }
}
