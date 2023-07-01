import 'package:botrick/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectScreenItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String text;
  final Function()? onTap;

  const SelectScreenItem({
    super.key,
    required this.iconUrl,
    required this.title,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: const EdgeInsets.all(6),
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(48),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconUrl,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(.6),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
