import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:whiz/core/constants/assets_manager.dart';
import 'package:whiz/core/constants/constants.dart';
import 'package:whiz/core/utils/custom_snackbar.dart';

class ChatItemImage extends StatefulWidget {
  final String imageUrl;

  const ChatItemImage({
    super.key,
    required this.imageUrl,
  });

  @override
  State<ChatItemImage> createState() => _ChatItemImageState();
}

class _ChatItemImageState extends State<ChatItemImage> {
  bool _isImageSaving = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width - 105,
          child: Center(
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
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
              icon: _isImageSaving
                  ? const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    )
                  : SvgPicture.asset(
                      AssetsManager.download,
                      color: Colors.white,
                      width: 20,
                    ),
              onPressed: () => !_isImageSaving ? _saveImage(context) : null,
            ),
          ),
        ),
      ],
    );
  }

  _saveImage(BuildContext context) async {
    setState(() {
      _isImageSaving = true;
    });

    try {
      final response = await Dio().get(
        widget.imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 100,
        name: "${DateTime.now()}",
      );

      if (mounted) {
        if (result['isSuccess'] as bool) {
          showSnackBar(
            context: context,
            message: Constants.IMAGE_SAVED_MESSAGE,
          );
        } else {
          showSnackBar(
            context: context,
            message: Constants.ERROR_MESSAGE,
          );
        }
      }
    } catch (error) {
      showSnackBar(
        context: context,
        message: Constants.ERROR_MESSAGE,
      );
    } finally {
      setState(() {
        _isImageSaving = false;
      });
    }
  }
}
