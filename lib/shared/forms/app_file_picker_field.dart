import 'dart:io';
import 'package:app/core/theme/app_text_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class AppFilePickerField extends StatefulWidget {
  final String label;
  final List<String> allowedExtensions;
  final ValueChanged<File?> onFileSelected;
  final File? initialFile;
  final String? initialValue;

  const AppFilePickerField({
    super.key,
    required this.label,
    required this.allowedExtensions,
    required this.onFileSelected,
    this.initialFile,
    this.initialValue,
  });

  @override
  State<AppFilePickerField> createState() => _AppFilePickerFieldState();
}

class _AppFilePickerFieldState extends State<AppFilePickerField> {
  File? _selectedFile;
  String? _currentInitialValue;

  @override
  void initState() {
    super.initState();
    _selectedFile = widget.initialFile;
    _currentInitialValue = widget.initialValue;
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: widget.allowedExtensions,
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      setState(() {
        _selectedFile = file;
      });
      widget.onFileSelected(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.label.toUpperCase(),
          style: AppTextStyles.label(
            color: colorScheme.primary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _pickFile,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.outline),
            ),
            child: Row(
              children: [
                Icon(
                  (_selectedFile != null || _currentInitialValue != null)
                      ? Icons.description
                      : Icons.upload_file,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _selectedFile != null
                        ? p.basename(_selectedFile!.path)
                        : (_currentInitialValue ?? ''),
                    style: AppTextStyles.body(
                      color: colorScheme.onSurface,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (_selectedFile != null || _currentInitialValue != null)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedFile = null;
                        _currentInitialValue = null;
                      });
                      widget.onFileSelected(null);
                    },
                    icon: const Icon(Icons.close, size: 18),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
