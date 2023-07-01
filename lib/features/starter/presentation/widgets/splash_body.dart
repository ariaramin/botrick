import 'package:botrick/features/starter/presentation/bloc/connectivity_event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:botrick/config/route/app_route_names.dart';
import 'package:botrick/core/constants/assets_manager.dart';
import 'package:botrick/features/starter/domain/utils/onboarding_manager.dart';
import 'package:botrick/features/starter/presentation/bloc/connectivity_bloc.dart';
import 'package:botrick/features/starter/presentation/bloc/connectivity_state.dart';
import 'package:botrick/features/starter/presentation/widgets/refresh_text.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            AssetsManager.splash,
            width: MediaQuery.of(context).size.width / 1.3,
          )
              .animate()
              .moveY(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              )
              .fade(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              ),
        ),
        BlocConsumer<ConnectivityBloc, ConnectivityState>(
          listener: (context, state) {
            if (state is ConnectivityUpdated && state.isConnected) {
              _navigateToAnotherScreen(context);
            }
          },
          builder: (context, state) {
            if (state is ConnectivityUpdated && !state.isConnected) {
              return RefreshText(
                onTap: () {
                  BlocProvider.of<ConnectivityBloc>(context)
                      .add(CheckConnectivityEvent());
                },
              );
            }
            return const SpinKitThreeBounce(
              color: Colors.white,
              size: 26,
            );
          },
        ),
        const SizedBox(width: double.infinity, height: 26),
        Text(
          'developer_name'.tr(),
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: double.infinity, height: 16),
      ],
    );
  }

  _navigateToAnotherScreen(BuildContext context) {
    bool isFirstTime = OnBoardingManager.getState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        isFirstTime ? AppRouteNames.selectLanguage : AppRouteNames.starter,
        (route) => false,
      );
    });
  }
}
