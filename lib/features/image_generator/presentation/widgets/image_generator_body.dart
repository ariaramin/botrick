import 'package:botrick/core/usecase/usecase.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_bloc.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_event.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_state.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_status.dart';
import 'package:botrick/features/image_generator/presentation/widgets/error_text.dart';
import 'package:botrick/features/image_generator/presentation/widgets/image_item.dart';
import 'package:botrick/features/image_generator/presentation/widgets/search_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageGeneratorBody extends StatefulWidget {
  const ImageGeneratorBody({
    super.key,
  });

  @override
  State<ImageGeneratorBody> createState() => _ImageGeneratorBodyState();
}

class _ImageGeneratorBodyState extends State<ImageGeneratorBody> {
  late TextEditingController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SearchTextField(
            controller: _controller,
            enabled: !_isLoading,
            onSubmitted: _generateImage,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: BlocConsumer<ImageGeneratorBloc, ImageGeneratorState>(
            listener: (context, state) =>
                _handleImageGeneratorStateChanges(state),
            builder: (context, state) {
              if (state.status is ImageGeneratorLoadingStatus) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state.status is ImageGeneratorLoadedStatus) {
                return SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: state.images.length,
                  itemBuilder: (context, index) {
                    return ImageItem(imageUrl: state.images[index]);
                  },
                );
              } else if (state.status is ImageGeneratorErrorStatus) {
                return SliverToBoxAdapter(
                  child: ErrorText(
                    text: (state.status as ImageGeneratorErrorStatus)
                        .errorMessage,
                    onPressed: _generateImage,
                  ),
                );
              }
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'nothing_to_show_message'.tr(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _generateImage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      BlocProvider.of<ImageGeneratorBloc>(context).add(
        GenerateImageEvent(params: Params(prompt: text)),
      );
    }
  }

  _handleImageGeneratorStateChanges(ImageGeneratorState state) {
    if (state.status is! ImageGeneratorInitStatus) {
      _changeLoadingStatus();
    }
  }

  _changeLoadingStatus() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }
}
