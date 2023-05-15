import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:whiz/config/route/app_route_names.dart';
import 'package:whiz/features/splash/domain/utils/onboarding_manager.dart';
import 'package:whiz/features/splash/presentation/bloc/splash_cubit.dart';
import 'package:whiz/features/splash/presentation/bloc/splash_state.dart';
import 'package:whiz/features/splash/presentation/widgets/refresh_text.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashCubit>(context).checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            "assets/images/whiz.png",
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
        BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is ConnectionOnState) {
              navigateToAnotherScreen(context);
            }
          },
          builder: (context, state) {
            if (state is SplashInitState || state is ConnectionOnState) {
              return const SpinKitThreeBounce(
                color: Colors.white,
                size: 26,
              );
            }
            if (state is ConnectionOffState) {
              return RefreshText(
                onTap: () {
                  BlocProvider.of<SplashCubit>(context).checkConnection();
                },
              );
            }
            return const SizedBox();
          },
        ),
        const SizedBox(width: double.infinity, height: 26),
      ],
    );
  }

  navigateToAnotherScreen(BuildContext context) {
    var isFirstTime = OnBoardingManager().getState();
    Future.delayed(const Duration(seconds: 3), () {
      if (isFirstTime) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteNames.onBoarding,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteNames.chat,
          (route) => false,
        );
      }
    });
  }
}
