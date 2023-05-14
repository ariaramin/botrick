import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whiz/config/theme/theme_provider.dart';

final locator = GetIt.instance;

Future initGetit() async {
  // shared preferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPreferences);

  // theme provider
  locator.registerSingleton<ThemeProvider>(ThemeProvider());

  // dio
  // locator.registerSingleton<Dio>(
  //   Dio(BaseOptions(baseUrl: Constants.BASE_URL)),
  // );
}
