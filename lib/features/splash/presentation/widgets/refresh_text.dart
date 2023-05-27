import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
        children: const [
          Icon(
            Iconsax.refresh_circle,
            color: Colors.white,
            size: 28,
          ),
          SizedBox(height: 6),
          Text(
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
