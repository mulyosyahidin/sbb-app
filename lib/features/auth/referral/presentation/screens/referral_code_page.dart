import 'package:app/app/app_router.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/utils/toast_util.dart';
import 'package:app/features/auth/referral/application/pending_referral_code_provider.dart';
import 'package:app/shared/forms/app_text_field.dart';
import 'package:app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ReferralCodePage extends ConsumerStatefulWidget {
  const ReferralCodePage({super.key});

  @override
  ConsumerState<ReferralCodePage> createState() => _ReferralCodePageState();
}

class _ReferralCodePageState extends ConsumerState<ReferralCodePage> {
  final _referralController = TextEditingController();

  @override
  void dispose() {
    _referralController.dispose();
    super.dispose();
  }

  void _handleSimpan() {
    if (_referralController.text.isEmpty) {
      ToastUtil.showError(
        context,
        title: 'Gagal',
        description: 'Kode referral tidak boleh kosong',
      );
      return;
    }

    ToastUtil.showSuccess(
      context,
      title: 'Berhasil',
      description: 'Kode referral berhasil disimpan',
    );
    _navigateToHome();
  }

  void _handleSkip() {
    _navigateToHome();
  }

  void _navigateToHome() {
    ref.read(pendingReferralCodeProvider.notifier).setPending(false);
    context.go(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/login_bg.webp',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 0.10),
                        AppColors.primary.withValues(alpha: 0.34),
                        AppColors.primaryDark.withValues(alpha: 0.92),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.08, 0.46, 1.0],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SafeArea(
                          bottom: false,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 26, 24, 0),
                            child: _buildHero(context),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 22, 24, 24),
                            child: Theme(
                              data: _buildFormTheme(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Punya Kode Referral?',
                                    style: AppTextStyles.title(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Masukkan kode referral dari teman Anda untuk mendapatkan penawaran menarik. Jika tidak ada, Anda bisa melewatinya.',
                                    style: AppTextStyles.body(
                                      color:
                                          Colors.white.withValues(alpha: 0.76),
                                      fontSize: 13,
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 22),
                                  AppTextField(
                                    controller: _referralController,
                                    label: 'KODE REFERRAL',
                                    prefixIcon: const Icon(Icons.card_giftcard,
                                        size: 20),
                                    textCapitalization:
                                        TextCapitalization.characters,
                                  ),
                                  const SizedBox(height: 28),
                                  PrimaryButton(
                                    label: 'Simpan',
                                    backgroundColor: Colors.white,
                                    foregroundColor: AppColors.primaryDark,
                                    onPressed: _handleSimpan,
                                  ),
                                  const SizedBox(height: 16),
                                  OutlinedButton(
                                    onPressed: _handleSkip,
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      side: BorderSide(color: Colors.white.withValues(alpha: 0.4)),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    child: Text(
                                      'Lewati',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  ThemeData _buildFormTheme(BuildContext context) {
    final base = Theme.of(context);

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: Colors.white,
        onSurface: Colors.white,
        onSurfaceVariant: Colors.white.withValues(alpha: 0.72),
        surface: Colors.white.withValues(alpha: 0.12),
        outline: Colors.white.withValues(alpha: 0.26),
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        fillColor: Colors.white.withValues(alpha: 0.12),
        hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.54)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.white.withValues(alpha: 0.24),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.white, width: 1.4),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 58,
              height: 58,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.18),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/icons/logo.png',
                    width: 44,
                    height: 44,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sarana Bahagia Berkah',
                    style: AppTextStyles.body(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Peternakan digital',
                    style: AppTextStyles.body(
                      color: Colors.white.withValues(alpha: 0.72),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
