import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whiz/config/theme/theme_provider.dart';
import 'package:whiz/core/constants/constants.dart';
import 'package:whiz/features/chat/data/datasource/chat_datasource.dart';
import 'package:whiz/features/chat/data/datasource/chat_datasource_impl.dart';
import 'package:whiz/features/chat/data/repository/chat_repository_impl.dart';
import 'package:whiz/features/chat/domain/repository/chat_repository.dart';
import 'package:whiz/features/splash/data/repository/splash_repository_impl.dart';
import 'package:whiz/features/splash/domain/repository/splash_repository.dart';

final locator = GetIt.instance;

Future initGetit() async {
  // shared preferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPreferences);

  // theme provider
  locator.registerSingleton<ThemeProvider>(ThemeProvider());

  // dio
  locator.registerSingleton<Dio>(
    Dio(BaseOptions(
      baseUrl: Constants.BASE_URL,
      headers: {
        "Authorization": "Bearer ${Constants.API_KEY}",
      },
    )),
  );

  // datasource
  locator.registerFactory<ChatDatasource>(() => ChatDatasourceImpl());

  // repository
  locator.registerFactory<SplashRepository>(() => SplashRepositoryImpl());
  locator.registerFactory<ChatRepository>(() => ChatRepositoryImpl());
}
