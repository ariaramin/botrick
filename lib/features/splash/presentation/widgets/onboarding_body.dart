import 'package:flutter/material.dart';
import 'package:whiz/config/route/app_route_names.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:whiz/features/splash/domain/utils/onboarding_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: const [
            Text(
              "You AI Assistant",
              style: TextStyle(
                fontSize: 24,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Using this software,you can ask you \n questions and receive articles using \n artificial intelligence assistant",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.greyColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Image.asset(
          "assets/images/on-boarding.png",
          width: MediaQuery.of(context).size.width / 1.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                OnBoardingManager().setState();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRouteNames.chat,
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(56),
                backgroundColor: AppColors.primaryColor,
              ),
              child: Text(
                AppLocalizations.of(context)!.getStarted,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
