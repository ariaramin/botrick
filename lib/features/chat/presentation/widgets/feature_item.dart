import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:botrick/features/chat/presentation/widgets/feature_text_container.dart';

class FeatureItem extends StatelessWidget {
  final String? iconData;
  final String title;
  final List<String>? descriptions;

  const FeatureItem({
    super.key,
    this.iconData,
    required this.title,
    this.descriptions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          iconData!,
          color: Theme.of(context).colorScheme.onBackground,
          height: 30,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: descriptions!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
              child: FeatureTextContainer(text: descriptions![index]),
            );
          },
        ),
      ],
    );
  }
}
