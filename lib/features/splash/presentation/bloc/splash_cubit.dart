import 'package:bloc/bloc.dart';
import 'package:botrick/di/di.dart';
import 'package:botrick/features/splash/domain/repository/splash_repository.dart';
import 'package:botrick/features/splash/presentation/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashRepository _splashRepository = locator.get();

  SplashCubit() : super(SplashInitState());

  checkConnection() async {
    emit(SplashInitState());
    bool isConnect = await _splashRepository.checkConnectivity();
    isConnect ? emit(ConnectionOnState()) : emit(ConnectionOffState());
  }
}
