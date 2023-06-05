import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/core/constants/assets_manager.dart';
import 'package:botrick/core/constants/constants.dart';
import 'package:botrick/core/constants/custom_snackbar.dart';

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
  bool _shouldReload = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 105,
          height: MediaQuery.of(context).size.width - 105,
          child: CachedNetworkImage(
            key: ValueKey<String>(_shouldReload ? 'reload' : widget.imageUrl),
            imageUrl: widget.imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Center(
              child: IconButton(
                onPressed: _reloadImage,
                icon: SvgPicture.asset(
                  AssetsManager.refresh,
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.darkColor
                      : Colors.white,
                ),
              ),
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

  _reloadImage() {
    setState(() {
      _shouldReload = !_shouldReload;
    });
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
        quality: 90,
        name: '${DateTime.now()}',
      );

      if (mounted) {
        if (result['isSuccess'] as bool) {
          showSnackBar(
            context: context,
            message: Constants.IMAGE_SAVED_MESSAGE,
            type: SnackBarTypeEnum.success,
          );
        } else {
          showSnackBar(
            context: context,
            message: Constants.ERROR_MESSAGE,
            type: SnackBarTypeEnum.error,
          );
        }
      }
    } catch (error) {
      showSnackBar(
        context: context,
        message: Constants.ERROR_MESSAGE,
        type: SnackBarTypeEnum.error,
      );
    } finally {
      setState(() {
        _isImageSaving = false;
      });
    }
  }
}
