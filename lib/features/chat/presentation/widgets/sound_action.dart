import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:whiz/core/constants/assets_manager.dart';
import 'package:whiz/core/providers/sound_provider.dart';
import 'package:whiz/di/di.dart';

class SoundAction extends StatelessWidget {
  final SoundProvider _soundProvider = locator.get();

  SoundAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _soundProvider,
      child: Consumer<SoundProvider>(
        builder: (context, value, child) {
          return IconButton(
            icon: value.isMute
                ? SvgPicture.asset(
                    AssetsManager.mute,
                    color: Colors.white,
                  )
                : SvgPicture.asset(
                    AssetsManager.volumeUp,
                    color: Colors.white,
                  ),
            onPressed: () => _soundProvider.isMute = !_soundProvider.isMute,
          );
        },
      ),
    );
  }
}
