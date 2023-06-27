import 'package:botrick/config/theme/theme_preferences.dart';
import 'package:botrick/features/image_generator/data/datasource/image_generator_datasource.dart';
import 'package:botrick/features/image_generator/data/datasource/image_generator_datasource_impl.dart';
import 'package:botrick/features/image_generator/data/repository/image_generator_repository_impl.dart';
import 'package:botrick/features/image_generator/domain/repository/image_generator_repository.dart';
import 'package:botrick/features/image_generator/domain/usecase/generate_image.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:botrick/core/constants/constants.dart';
import 'package:botrick/core/providers/sound_provider.dart';
import 'package:botrick/features/chat/data/datasource/chat_datasource.dart';
import 'package:botrick/features/chat/data/datasource/chat_datasource_impl.dart';
import 'package:botrick/features/chat/data/repository/chat_repository_impl.dart';
import 'package:botrick/features/chat/domain/repository/chat_repository.dart';
import 'package:botrick/features/chat/domain/usecase/send_message.dart';
import 'package:botrick/features/splash/data/repository/splash_repository_impl.dart';
import 'package:botrick/features/splash/domain/repository/splash_repository.dart';

final locator = GetIt.instance;

Future initGetit() async {
  // shared preferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPreferences);

  // theme preferences
  locator.registerSingleton<ThemePreferences>(ThemePreferences());

  // provider
  locator.registerSingleton<SoundProvider>(SoundProvider());

  // dio
  locator.registerSingleton<Dio>(
    Dio(BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Constants.apiKey}',
      },
    )),
  );

  // datasource
  locator.registerFactory<ChatDatasource>(
      () => ChatDatasourceImpl(locator.get<Dio>()));

  locator.registerFactory<ImageGeneratorDatasource>(
      () => ImageGeneratorDatasourceImpl(locator.get<Dio>()));

  // repository
  locator.registerFactory<SplashRepository>(() => SplashRepositoryImpl());

  locator.registerFactory<ChatRepository>(
      () => ChatRepositoryImpl(locator.get<ChatDatasource>()));

  locator.registerFactory<ImageGeneratorRepository>(() =>
      ImageGeneratorRepositoryImpl(locator.get<ImageGeneratorDatasource>()));

  // usecase
  locator.registerFactory<SendMessage>(
      () => SendMessage(locator.get<ChatRepository>()));

  locator.registerFactory<GenerateImage>(
      () => GenerateImage(locator.get<ImageGeneratorRepository>()));
}
