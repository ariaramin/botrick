import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:botrick/config/route/app_route_names.dart';
import 'package:botrick/features/splash/domain/entity/slider.dart';
import 'package:botrick/features/splash/domain/utils/onboarding_manager.dart';
import 'package:botrick/features/splash/presentation/widgets/slider_item.dart';

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
    _controller = PageController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Precache slider images
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
            itemCount: SliderModel.getSliders().length,
            itemBuilder: (context, index) => _buildSliderItem(index),
            onPageChanged: _onPageChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 38),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: Text(
                  currentIndex == SliderModel.getSliders().length - 1
                      ? 'get_started'.tr()
                      : 'next'.tr(),
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
      // Set onboarding state and navigate to the chat screen
      OnBoardingManager.setState();
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouteNames.starter,
        (route) => false,
      );
    } else {
      // Move to the next slide
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
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
