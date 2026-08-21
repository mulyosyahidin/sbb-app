import 'package:app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextAreaField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int minLines;
  final int? maxLines;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final bool enabled;

  const AppTextAreaField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.validator,
    this.minLines = 3,
    this.maxLines,
    this.autofocus = false,
    this.onChanged,
    this.errorText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label.toUpperCase(),
          style: AppTextStyles.label(
            color: colorScheme.primary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          enabled: enabled,
          validator: validator,
          minLines: minLines,
          maxLines: maxLines,
          keyboardType: TextInputType.multiline,
          autofocus: autofocus,
          onChanged: onChanged,
          style: AppTextStyles.body(
            fontWeight: FontWeight.w500,
            color: colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            fillColor: colorScheme.primaryContainer.withValues(alpha: 0.1),
            alignLabelWithHint: true,
          ),
        ),
      ],
    );
  }
}
