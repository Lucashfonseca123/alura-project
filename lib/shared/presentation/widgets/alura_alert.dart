import 'package:flutter/material.dart';
import 'package:teste_alura/design_system/alura_colors.dart';

abstract class AluraAlert {
  static showError(BuildContext context,
          {required String message, EdgeInsetsGeometry? margin}) =>
      _defaultAlert(context,
          message: message,
          margin: margin,
          backgroundColor: AluraColors.pink.withOpacity(0.95));

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccess(
    BuildContext context, {
    required String message,
    Widget? suffixIcon,
    Duration? duration,
  }) =>
      _defaultAlert(context,
          message: message,
          backgroundColor: AluraColors.green.withOpacity(0.95),
          icon: const Icon(
            Icons.check_circle,
            color: Colors.black,
          ),
          suffixIcon: suffixIcon,
          duration: duration,
          textColor: Colors.black);

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      _defaultAlert(BuildContext context,
              {Color? backgroundColor,
              Color? textColor,
              Widget? icon,
              Widget? suffixIcon,
              Duration? duration,
              EdgeInsetsGeometry? margin,
              required String message}) =>
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: backgroundColor,
              margin: margin,
              duration: duration ?? const Duration(seconds: 3),
              content: Row(
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: icon,
                    ),
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  if (suffixIcon != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: suffixIcon,
                    ),
                ],
              ),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          );
}
