import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Feature {
  final IconData? iconData;
  final String? title;
  final List<FeatureDescription>? descriptions;

  Feature({
    this.iconData,
    this.title,
    this.descriptions,
  });

  static List<Feature> getFeatures() {
    return [
      Feature(
        iconData: Iconsax.sun_1,
        title: "Example",
        descriptions: [
          FeatureDescription(text: "Explain quantum computing in simple terms"),
          FeatureDescription(
              text: "Got any creative ideas for a 10 year old’s birthday?"),
          FeatureDescription(
              text: "How do I make an HTTP request in Javascript?"),
        ],
      ),
      Feature(
        iconData: Iconsax.flash_1,
        title: "Capabilities",
        descriptions: [
          FeatureDescription(
              text: "Remembers what user said earlier in the conversation"),
          FeatureDescription(
              text: "Allows user to provide follow-up corrections"),
          FeatureDescription(text: "Trained to decline inappropriate requests"),
        ],
      ),
      Feature(
        iconData: Iconsax.danger,
        title: "Limitations",
        descriptions: [
          FeatureDescription(
              text: "May occasionally generate incorrect information"),
          FeatureDescription(
              text:
                  "May occasionally produce harmful instructions or biased content"),
          FeatureDescription(
              text: "Limited knowledge of world and events after 2021"),
        ],
      ),
    ];
  }
}

class FeatureDescription {
  final String? text;

  FeatureDescription({this.text});
}
