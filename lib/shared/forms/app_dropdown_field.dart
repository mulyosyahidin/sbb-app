import 'package:app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppDropdownField<T> extends StatelessWidget {
  final String label;
  final String? hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final Widget? prefixIcon;
  final bool enabled;
  final String? errorText;

  const AppDropdownField({
    super.key,
    required this.label,
    required this.items,
    this.hint,
    this.value,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.enabled = true,
    this.errorText,
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
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          isExpanded: true,
          onChanged: enabled ? onChanged : null,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon,
            errorText: errorText,
            fillColor: colorScheme.primaryContainer.withValues(alpha: 0.1),
          ),
          style: AppTextStyles.body(
            fontWeight: FontWeight.w500,
            color: colorScheme.onSurface,
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: colorScheme.onSurfaceVariant,
          ),
          dropdownColor: colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
      ],
    );
  }
}
