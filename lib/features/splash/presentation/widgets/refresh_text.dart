import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          const Icon(
            Iconsax.refresh_circle,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(height: 6),
          Text(
            AppLocalizations.of(context)!.connectionError,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
