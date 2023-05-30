import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final String? image, title, description;

  const SliderItem({
    super.key,
    this.image,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(image!),
          Column(
            children: [
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
            ],
          ),
          // const SizedBox(height: 38),
        ],
      ),
    );
  }
}
