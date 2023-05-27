import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:whiz/core/providers/sound_provider.dart';
import 'package:whiz/di/di.dart';

class MuteAction extends StatelessWidget {
  final SoundProvider _soundProvider = locator.get();

  MuteAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _soundProvider,
      child: Consumer<SoundProvider>(
        builder: (context, value, child) {
          return IconButton(
            icon: Icon(
              value.isMute ? Iconsax.volume_high : Iconsax.volume_slash,
              color: Colors.white,
            ),
            onPressed: () => _soundProvider.isMute = !_soundProvider.isMute,
          );
        },
      ),
    );
  }
}
