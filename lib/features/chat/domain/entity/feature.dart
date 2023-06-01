import 'package:botrick/core/constants/assets_manager.dart';

class Feature {
  final String? iconData;
  final String? title;
  final List<String>? descriptions;

  Feature({
    this.iconData,
    this.title,
    this.descriptions,
  });

  static List<Feature> getFeatures() {
    return [
      Feature(
        iconData: AssetsManager.sunOutline,
        title: "Example",
        descriptions: [
          "Explain quantum computing in simple terms",
          "Got any creative ideas for a 10 year old’s birthday?",
          "/img portrait of a white cat that looks curious",
        ],
      ),
      Feature(
        iconData: AssetsManager.flash,
        title: "Capabilities",
        descriptions: [
          "Remembers what user said earlier in the conversation",
          "Allows user to provide follow-up corrections",
          "Trained to decline inappropriate requests",
        ],
      ),
      Feature(
        iconData: AssetsManager.danger,
        title: "Limitations",
        descriptions: [
          "May occasionally generate incorrect information",
          "May occasionally produce harmful instructions or biased content",
          "Limited knowledge of world and events after 2021",
        ],
      ),
    ];
  }
}
