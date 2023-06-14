import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:botrick/core/constants/assets_manager.dart';
import 'package:botrick/core/providers/sound_provider.dart';
import 'package:botrick/di/di.dart';

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
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )
                : SvgPicture.asset(
                    AssetsManager.volumeUp,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
            onPressed: () => _soundProvider.isMute = !_soundProvider.isMute,
          );
        },
      ),
    );
  }
}
