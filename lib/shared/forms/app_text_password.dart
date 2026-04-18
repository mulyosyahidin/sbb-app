import 'package:app/core/theme/app_theme.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:flutter/material.dart';

class AppTextPassword extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final String? errorText;

  const AppTextPassword({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.textInputAction,
    this.onFieldSubmitted,
    this.errorText,
  });

  @override
  State<AppTextPassword> createState() => _AppTextPasswordState();
}

class _AppTextPasswordState extends State<AppTextPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: widget.label,
      hint: widget.hint,
      controller: widget.controller,
      validator: widget.validator,
      prefixIcon: widget.prefixIcon,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      errorText: widget.errorText,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: AppColors.textSecondaryLight,
          size: 20,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
