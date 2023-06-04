import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:botrick/di/di.dart';
import 'package:botrick/features/splash/domain/repository/splash_repository.dart';
import 'package:botrick/features/splash/presentation/bloc/connectivity_event.dart';
import 'package:botrick/features/splash/presentation/bloc/connectivity_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final SplashRepository _splashRepository = locator.get();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // Handle CheckConnectivityEvent
  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<CheckConnectivityEvent>((event, emit) async {
      emit(ConnectivityInitial());
      bool isConnected = await _splashRepository.checkConnectivity();
      emit(ConnectivityUpdated(isConnected));
    });

    // Listen for connectivity changes
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) async {
      add(CheckConnectivityEvent());
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
