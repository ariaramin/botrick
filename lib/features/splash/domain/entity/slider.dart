import 'package:whiz/core/constants/assets_manager.dart';

class SliderModel {
  final String? image;
  final String? title;
  final String? descriptions;

  SliderModel({
    this.image,
    this.title,
    this.descriptions,
  });

  static List<SliderModel> getSliders() {
    return [
      SliderModel(
        image: AssetsManager.welcome,
        title: "Welcome to Whiz",
        descriptions:
            "Start a conversation with Whiz to unlock knowledge, creativity, and friendly interaction. Embark on an exciting journey with your AI companion and let technology enhance your everyday life.",
      ),
      SliderModel(
        image: AssetsManager.seeking,
        title: "Seek Inromation",
        descriptions:
            "Whiz can serve as a powerful information resource. You can ask questions about a wide range of topics, such as history, science, sports, or current events, and receive informative and detailed responses.",
      ),
      SliderModel(
        image: AssetsManager.recommendation,
        title: "Get Recommendations",
        descriptions:
            "Whether you're looking for movie recommendations, book suggestions, or travel destinations, Whiz can provide personalized recommendations based on your preferences and interests.",
      ),
      SliderModel(
        image: AssetsManager.writing,
        title: "Creative Writing",
        descriptions:
            "If you need help with writing stories, essays, or other creative pieces, Whiz can provide suggestions, brainstorm ideas, and offer guidance, and help elevate your writing to the next level.",
      ),
      SliderModel(
        image: AssetsManager.imageGeneration,
        title: "Image Generation",
        descriptions:
            "Whiz can create original images based on textual prompts. You can describe an object, a scene, or a concept, and Whiz will generate a corresponding image that matches your description.",
      ),
    ];
  }
}