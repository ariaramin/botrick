import 'package:flutter/material.dart';
import 'package:whiz/features/chat/domain/entity/feature.dart';
import 'package:whiz/features/chat/presentation/widgets/text_container.dart';

class FeaturesItem extends StatelessWidget {
  final IconData? iconData;
  final String title;
  final List<FeatureDescription>? descriptions;

  const FeaturesItem({
    super.key,
    this.iconData,
    required this.title,
    this.descriptions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 38,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        ListView.builder(
          shrinkWrap: true,
          itemCount: descriptions!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
              child: TextContainer(text: descriptions![index].text!),
            );
          },
        ),
      ],
    );
  }
}
