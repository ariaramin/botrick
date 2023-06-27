import 'package:botrick/core/constants/constants.dart';
import 'package:botrick/core/constants/custom_snackbar.dart';
import 'package:botrick/features/splash/presentation/bloc/connectivity_bloc.dart';
import 'package:botrick/features/splash/presentation/bloc/connectivity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/features/chat/presentation/widgets/app_icon_button.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  final Function() onSubmitted;
  final Widget buttonIcon;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.enabled = true,
    required this.onSubmitted,
    required this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectivityBloc, ConnectivityState>(
      listener: (context, state) {
        final isConnected =
            state is ConnectivityUpdated ? state.isConnected : true;
        if (!isConnected) {
          _raiseErrorSnackBar(context);
        }
      },
      builder: (context, state) {
        final isConnected =
            state is ConnectivityUpdated ? state.isConnected : true;
        return Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ),
                decoration: ShapeDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.darkColor
                      : AppColors.primaryContainerDarkColor,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(42),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: AppColors.backgroundDarkColor,
                      blurRadius: 25,
                      spreadRadius: -12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: controller,
                  onFieldSubmitted: (_) => isConnected
                      ? onSubmitted()
                      : _raiseErrorSnackBar(context),
                  enabled: enabled,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            AppIconButton(
              icon: buttonIcon,
              onTap: () =>
                  isConnected ? onSubmitted() : _raiseErrorSnackBar(context),
            ),
          ],
        );
      },
    );
  }

  _raiseErrorSnackBar(BuildContext context) {
    showSnackBar(
      context: context,
      message: Constants().connectionErrorMessage,
      type: SnackBarTypeEnum.error,
    );
  }
}
