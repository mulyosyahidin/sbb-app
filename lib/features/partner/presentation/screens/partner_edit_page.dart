import 'package:app/core/errors/failure.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/partner/application/partner_form_controller.dart';
import 'package:app/features/partner/domain/entities/partner.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/forms/app_textarea_field.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PartnerEditPage extends ConsumerStatefulWidget {
  final Partner partner;

  const PartnerEditPage({
    super.key,
    required this.partner,
  });

  @override
  ConsumerState<PartnerEditPage> createState() => _PartnerEditPageState();
}

class _PartnerEditPageState extends ConsumerState<PartnerEditPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _nikController;
  late final TextEditingController _addressController;
  late final TextEditingController _phoneController;
  late final TextEditingController _joinDateController;
  Map<String, String> _fieldErrors = {};

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.partner.name);
    _nikController = TextEditingController(text: widget.partner.nik);
    _addressController = TextEditingController(text: widget.partner.address);
    _phoneController = TextEditingController(text: widget.partner.phoneNumber);
    _joinDateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(widget.partner.joinDate),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nikController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _joinDateController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() => _fieldErrors = {});

    if (_nameController.text.isEmpty ||
        _nikController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _phoneController.text.isEmpty) {
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'Mohon isi semua bidang yang wajib diisi',
      );
      return;
    }

    ref.read(partnerFormControllerProvider.notifier).updatePartner(
          name: _nameController.text,
          nik: _nikController.text,
          address: _addressController.text,
          phoneNumber: _phoneController.text,
          joinDate: _joinDateController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final formStatus = ref.watch(partnerFormControllerProvider);
    final isLoading = formStatus is AsyncLoading;

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
            title: 'Terjadi kesalahan',
            description: next.error.toString(),
          );
        }
      } else if (next is AsyncData &&
          previous is AsyncLoading &&
          next.value == null) {
        ToastUtil.showSuccess(
          context,
          title: 'Berhasil',
          description: 'Data mitra berhasil diperbarui',
        );
        context.pop();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Edit Data Mitra',
              subtitle: 'Perbarui informasi data diri kemitraan Anda',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                    AppTextField(
                      controller: _phoneController,
                      label: 'Nomor Telepon',
                      keyboardType: TextInputType.phone,
                      prefixIcon: const Icon(Icons.phone_outlined),
                      errorText: _fieldErrors['phone_number'],
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      controller: _joinDateController,
                      label: 'Tanggal Bergabung',
                      readOnly: true,
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                      errorText: _fieldErrors['join_date'],
                    ),
                    const SizedBox(height: 40),
                    PrimaryButton(
                      label: 'SIMPAN PERUBAHAN',
                      onPressed: isLoading ? null : _handleSubmit,
                      isLoading: isLoading,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
