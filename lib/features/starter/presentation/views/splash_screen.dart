import 'package:botrick/features/starter/presentation/bloc/connectivity_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/features/starter/presentation/bloc/connectivity_bloc.dart';
import 'package:botrick/features/starter/presentation/widgets/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectivityBloc()..add(CheckConnectivityEvent()),
      child: const Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SplashBody(),
      ),
    );
  }
}
