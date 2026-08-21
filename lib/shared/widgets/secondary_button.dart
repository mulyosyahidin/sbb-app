import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool isLoading;
  final double? width;
  final Color? color;
  final Color? backgroundColor;

  const SecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.width = double.infinity,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(color: color ?? AppColors.primaryContainer),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: backgroundColor ?? (Theme.of(context).brightness == Brightness.dark ? AppColors.surfaceDark : AppColors.surfaceLight),
          foregroundColor: color ?? (Theme.of(context).brightness == Brightness.dark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryDark),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    IconTheme(
                      data: IconThemeData(
                        color: color ?? (Theme.of(context).brightness == Brightness.dark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                        size: 20,
                      ),
                      child: icon!,
                    ),
                    const SizedBox(width: 12),
                  ],
                  Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
