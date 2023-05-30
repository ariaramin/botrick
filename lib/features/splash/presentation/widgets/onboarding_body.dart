import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:whiz/config/route/app_route_names.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:whiz/features/splash/domain/entity/slider.dart';
import 'package:whiz/features/splash/domain/utils/onboarding_manager.dart';
import 'package:whiz/features/splash/presentation/widgets/slider_item.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var i = 0; i < SliderModel.getSliders().length; i++) {
      precacheImage(AssetImage(SliderModel.getSliders()[i].image!), context);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 28),
        Expanded(
          child: PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: SliderModel.getSliders().length,
            itemBuilder: (context, index) => _buildSliderItem(index),
            onPageChanged: _onPageChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 38),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: _controller, // PageController
                count: SliderModel.getSliders().length,
                effect: const WormEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                ),
              ),
              ElevatedButton(
                onPressed: _onNextButtonPressed,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(56),
                  backgroundColor: AppColors.primaryColor,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
                child: Text(
                  currentIndex == SliderModel.getSliders().length - 1
                      ? "Get Started"
                      : "Next",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _onNextButtonPressed() {
    if (currentIndex == SliderModel.getSliders().length - 1) {
      OnBoardingManager().setState();
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouteNames.chat,
        (route) => false,
      );
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  _buildSliderItem(int index) {
    final sliders = SliderModel.getSliders();
    return SliderItem(
      image: sliders[index].image,
      title: sliders[index].title,
      description: sliders[index].descriptions,
    );
  }

  _onPageChanged(int value) {
    setState(() {
      currentIndex = value;
    });
  }
}
