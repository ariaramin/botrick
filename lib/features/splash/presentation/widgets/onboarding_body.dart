import 'package:flutter/material.dart';
import 'package:whiz/config/theme/app_colors.dart';

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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(56),
                backgroundColor: AppColors.primaryColor,
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
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
