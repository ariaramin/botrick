import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/whiz.png",
        width: MediaQuery.of(context).size.width / 2,
      ),
    );
  }
}
