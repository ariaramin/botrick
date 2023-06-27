import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:botrick/di/di.dart';
import 'package:botrick/features/image_generator/domain/usecase/generate_image.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_bloc.dart';
import 'package:botrick/features/image_generator/presentation/widgets/image_generator_appbar.dart';
import 'package:botrick/features/image_generator/presentation/widgets/image_generator_body.dart';
import 'package:botrick/features/splash/presentation/bloc/connectivity_bloc.dart';
import 'package:botrick/features/splash/presentation/bloc/connectivity_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageGeneratorScreen extends StatelessWidget {
  const ImageGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageGeneratorBloc>(
          create: (BuildContext context) => ImageGeneratorBloc(
            locator.get<GenerateImage>(),
          ),
        ),
        BlocProvider<ConnectivityBloc>(
          create: (BuildContext context) =>
              ConnectivityBloc()..add(CheckConnectivityEvent()),
        ),
      ],
      child: ThemeSwitchingArea(
        child: const Scaffold(
          appBar: ImageGeneratorAppBar(),
          body: SafeArea(
            child: ImageGeneratorBody(),
          ),
        ),
      ),
    );
  }
}
