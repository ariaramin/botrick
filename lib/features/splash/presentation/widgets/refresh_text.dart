import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:botrick/core/constants/assets_manager.dart';

class RefreshText extends StatelessWidget {
  final Function()? onTap;

  const RefreshText({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            AssetsManager.refresh,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          const Text(
            "Check your network connection",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
