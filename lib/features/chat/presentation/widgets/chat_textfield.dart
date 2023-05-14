import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whiz/config/theme/app_colors.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 10, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: AppColors.greyColor,
            blurRadius: 25,
            spreadRadius: -12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                hintText: "Write your message",
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.send_1,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
