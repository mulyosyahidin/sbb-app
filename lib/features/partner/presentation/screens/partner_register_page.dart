import 'package:app/core/auth/application/auth_session_controller.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/partner/application/partner_form_controller.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/forms/app_textarea_field.dart';
import 'package:app/shared/forms/app_dropdown_field.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PartnerRegisterPage extends ConsumerStatefulWidget {
  const PartnerRegisterPage({super.key});

  @override
  ConsumerState<PartnerRegisterPage> createState() =>
      _PartnerRegisterPageState();
}

class _PartnerRegisterPageState extends ConsumerState<PartnerRegisterPage> {
  final _nameController = TextEditingController();
  final _nikController = TextEditingController();
  final _addressController = TextEditingController();
  final _joinDateController = TextEditingController();
  String _selectedLevel = 'partner';
  Map<String, String> _fieldErrors = {};

  @override
  void initState() {
    super.initState();
    // Initial check in case data is already available
    final user = ref.read(authSessionControllerProvider).value?.user;
    if (user != null) {
      _nameController.text = user.name;
    }
    _joinDateController.text = DateFormat('yyyy-MM-dd').format(
      DateTime.now(),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nikController.dispose();
    _addressController.dispose();
    _joinDateController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() => _fieldErrors = {});

    if (_nameController.text.isEmpty ||
        _nikController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _joinDateController.text.isEmpty) {
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'Mohon isi semua bidang yang wajib diisi',
      );
      return;
    }

    ref.read(partnerFormControllerProvider.notifier).registerPartner(
          name: _nameController.text,
          nik: _nikController.text,
          address: _addressController.text,
          joinDate: _joinDateController.text,
          level: _selectedLevel,
        );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _joinDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formStatus = ref.watch(partnerFormControllerProvider);
    final isLoading = formStatus is AsyncLoading;
    final colorScheme = Theme.of(context).colorScheme;

    final sessionState = ref.watch(authSessionControllerProvider);

    ref.listen(authSessionControllerProvider, (previous, next) {
      if (next.hasValue && _nameController.text.isEmpty) {
        final user = next.value?.user;
        if (user != null) {
          _nameController.text = user.name;
        }
      }
    });

    ref.listen(partnerFormControllerProvider, (previous, next) {
      if (next is AsyncError) {
        final error = next.error;
        if (error is ValidationFailure) {
          setState(() {
            _fieldErrors = error.errors ?? {};
          });
          ToastUtil.showError(
            context,
            title: 'Terjadi kesalahan',
            description: error.message,
          );
        } else if (error is Failure) {
          ToastUtil.showError(
            context,
            title: 'Gagal',
            description: error.message,
          );
        } else {
          ToastUtil.showError(
            context,
            title: 'Gagal',
            description: next.error.toString(),
          );
        }
      } else if (next is AsyncData &&
          previous is AsyncLoading &&
          next.value == null) {
        ToastUtil.showSuccess(
          context,
          title: 'Berhasil',
          description: 'Berhasil mendaftar sebagai mitra',
        );
        context.pop();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Buka Kemitraan',
              subtitle: 'Form pendaftaran mitra baru',
            ),
            Expanded(
              child: sessionState.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stack) => Center(
                  child: Text('Gagal memuat data user: $error'),
                ),
                data: (session) => SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer
                              .withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: colorScheme.primary.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: colorScheme.primary,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Silahkan input data diri Anda. Anda dapat melanjutkan pembuatan kontrak dihalaman selanjutnya',
                                style: AppTextStyles.body(
                                  color: colorScheme.primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      AppTextField(
                        controller: _nameController,
                        label: 'Nama Lengkap',
                        prefixIcon: const Icon(Icons.person_outline),
                        errorText: _fieldErrors['name'],
                      ),
                      const SizedBox(height: 20),
                      AppTextField(
                        controller: _nikController,
                        label: 'NIK',
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(Icons.badge_outlined),
                        errorText: _fieldErrors['nik'],
                      ),
                      const SizedBox(height: 20),
                      AppTextAreaField(
                        controller: _addressController,
                        label: 'Alamat',
                        minLines: 4,
                        errorText: _fieldErrors['address'],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: isLoading ? null : _selectDate,
                        child: AbsorbPointer(
                          child: AppTextField(
                            controller: _joinDateController,
                            label: 'TANGGAL BERGABUNG',
                            hint: 'Pilih tanggal',
                            prefixIcon:
                                const Icon(Icons.calendar_today_outlined),
                            errorText: _fieldErrors['join_date'],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      AppDropdownField<String>(
                        label: 'Level Kemitraan',
                        hint: 'Pilih level kemitraan',
                        prefixIcon: const Icon(Icons.stars_outlined),
                        items: const [
                          DropdownMenuItem(
                            value: 'partner',
                            child: Text('Mitra'),
                          ),
                          DropdownMenuItem(
                            value: 'consultant',
                            child: Text('Konsultan'),
                          ),
                          DropdownMenuItem(
                            value: 'partner_consultant',
                            child: Text('Mitra & Konsultan'),
                          ),
                        ],
                        value: _selectedLevel,
                        onChanged: (val) {
                          if (val != null) {
                            setState(() => _selectedLevel = val);
                          }
                        },
      ),
                      const SizedBox(height: 32),
                      PrimaryButton(
                        onPressed: isLoading ? null : _handleSubmit,
                        isLoading: isLoading,
                        label: 'DAFTARKAN SEKARANG',
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
