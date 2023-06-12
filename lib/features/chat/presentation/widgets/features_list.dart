import 'package:botrick/features/chat/domain/entity/feature.dart';
import 'package:botrick/features/chat/presentation/widgets/feature_item.dart';
import 'package:flutter/material.dart';

class FeaturesList extends StatelessWidget {
  const FeaturesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final features = Feature.getFeatures();
    return ListView.separated(
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return Padding(
          padding: index == features.length - 1
              ? const EdgeInsets.only(top: 12, bottom: 108)
              : const EdgeInsets.symmetric(vertical: 12),
          child: FeatureItem(
            iconData: feature.iconData,
            title: feature.title!,
            descriptions: feature.descriptions,
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
    );
  }
}
