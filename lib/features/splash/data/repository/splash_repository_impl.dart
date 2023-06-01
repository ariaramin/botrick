import 'dart:io';
import 'package:botrick/features/splash/domain/repository/splash_repository.dart';

class SplashRepositoryImpl extends SplashRepository {
  @override
  Future<bool> checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
