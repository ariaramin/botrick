import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:whiz/core/constants/assets_manager.dart';

class ChatItemImage extends StatelessWidget {
  final String imageUrl;

  const ChatItemImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width - 105,
          child: Center(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: CircleAvatar(
            backgroundColor: AppColors.darkColor,
            radius: 16,
            child: IconButton(
              icon: SvgPicture.asset(
                AssetsManager.download,
                color: Colors.white,
                width: 20,
              ),
              onPressed: _saveImage,
            ),
          ),
        ),
      ],
    );
  }

  _saveImage() async {
    var response = await Dio().get(
      imageUrl,
      options: Options(responseType: ResponseType.bytes),
    );
    final Map<Object?, Object?> result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 100,
        name: "${DateTime.now()}");
    if (result["errorMessage"] != null) {
      print(result["errorMessage"]);
    }
    if (result["isSuccess"] as bool) {
      print(result["isSuccess"]);
    }
  }
}
