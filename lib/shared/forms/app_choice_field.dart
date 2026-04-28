import 'package:app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ChoiceOption<T> {
  final String label;
  final T value;

  const ChoiceOption({
    required this.label,
    required this.value,
  });
}

class AppChoiceField<T> extends StatelessWidget {
  final String label;
  final List<ChoiceOption<T>> options;
  final T selected;
  final ValueChanged<T> onSelected;
  final Axis? direction;

  const AppChoiceField({
    super.key,
    required this.label,
    required this.options,
    required this.selected,
    required this.onSelected,
    this.direction,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Use vertical layout if there are more than 2 options or explicitly requested
    final bool useVertical = direction == Axis.vertical || options.length > 2;

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
        const SizedBox(height: 12),
        if (useVertical)
          Column(
            children: options.map((option) {
              final isSelected = selected == option.value;
              return Padding(
                padding: EdgeInsets.only(
                  bottom: option.value == options.last.value ? 0 : 8,
                ),
                child: _buildOption(context, option, isSelected),
              );
            }).toList(),
          )
        else
          Row(
            children: options.map((option) {
              final isSelected = selected == option.value;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: option.value == options.last.value ? 0 : 8,
                  ),
                  child: _buildOption(context, option, isSelected),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildOption(
    BuildContext context,
    ChoiceOption<T> option,
    bool isSelected,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => onSelected(option.value),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? colorScheme.primary : colorScheme.outline,
          ),
        ),
        child: Text(
          option.label,
          textAlign: TextAlign.center,
          style: AppTextStyles.body(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
