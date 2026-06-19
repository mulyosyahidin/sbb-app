import 'package:app/features/home/application/home_controller.dart';
import 'package:app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kSplashDisplayDelay = Duration(seconds: 5);

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _progressController;
  late Animation<double> _scale;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _progressController = AnimationController(
      vsync: this,
      duration: kSplashDisplayDelay == Duration.zero
          ? const Duration(milliseconds: 1200)
          : kSplashDisplayDelay,
    );

    _scale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _opacity = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _controller.forward();
    _progressController.forward();

    // Pre-fetch sliders while showing splash screen
    ref.read(slidersProvider.future);
  }

  @override
  void dispose() {
    _controller.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF1F6E2D);
    const darkGreen = Color(0xFF155B24);
    const gold = Color(0xFFD3AB35);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E6),
      body: Stack(
        children: [
          const Positioned.fill(
            child: _SplashBackground(),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  SlideTransition(
                    position: _slide,
                    child: FadeTransition(
                      opacity: _opacity,
                      child: Column(
                        children: [
                          ScaleTransition(
                            scale: _scale,
                            child: const _SplashLogo(),
                          ),
                          const SizedBox(height: 26),
                          Text(
                            'Sarana Bahagia Berkah',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.title(
                              color: darkGreen,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0,
                              height: 1.15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Usaha ternak sapi yang transparan dan terukur',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.body(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                              fontSize: 13,
                              height: 1.45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                  FadeTransition(
                    opacity: _opacity,
                    child: Column(
                      children: [
                        AnimatedBuilder(
                          animation: _progressController,
                          builder: (context, child) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(999),
                              child: LinearProgressIndicator(
                                minHeight: 6,
                                value: _progressController.value,
                                backgroundColor: Colors.white,
                                color: green,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: gold,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Menyiapkan aplikasi...',
                              style: AppTextStyles.body(
                                color: darkGreen.withValues(alpha: 0.72),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 34),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SplashBackground extends StatelessWidget {
  const _SplashBackground();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SplashBackgroundPainter(),
    );
  }
}

class _SplashBackgroundPainter extends CustomPainter {
  static const _green = Color(0xFF1F6E2D);
  static const _gold = Color(0xFFD3AB35);
  static const _cream = Color(0xFFF5F0E6);

  @override
  void paint(Canvas canvas, Size size) {
    final background = Paint()..color = _cream;
    canvas.drawRect(Offset.zero & size, background);

    final topBand = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFE9F6DF),
          Color(0x00E9F6DF),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height * 0.55));
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height * 0.55),
      topBand,
    );

    final path = Path()
      ..moveTo(0, size.height * 0.18)
      ..cubicTo(
        size.width * 0.28,
        size.height * 0.10,
        size.width * 0.64,
        size.height * 0.26,
        size.width,
        size.height * 0.14,
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(
      path,
      Paint()..color = Colors.white.withValues(alpha: 0.54),
    );

    final fieldPaint = Paint()
      ..color = _green.withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;

    for (var i = 0; i < 5; i++) {
      final y = size.height * (0.73 + i * 0.045);
      final wave = Path()
        ..moveTo(-20, y)
        ..quadraticBezierTo(
          size.width * 0.28,
          y - 26,
          size.width * 0.55,
          y,
        )
        ..quadraticBezierTo(
          size.width * 0.78,
          y + 24,
          size.width + 20,
          y - 8,
        );
      canvas.drawPath(wave, fieldPaint);
    }

    final leafPaint = Paint()..color = _gold.withValues(alpha: 0.18);
    final leafCenter = Offset(size.width * 0.82, size.height * 0.68);
    canvas.save();
    canvas.translate(leafCenter.dx, leafCenter.dy);
    canvas.rotate(-0.55);
    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: 58, height: 20),
      leafPaint,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SplashLogo extends StatefulWidget {
  const _SplashLogo();

  @override
  State<_SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<_SplashLogo> {
  bool _isAssetLoaded = false;

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF1F6E2D);

    return Container(
      width: 118,
      height: 118,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: green.withValues(alpha: 0.14),
            blurRadius: 28,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            opacity: _isAssetLoaded ? 0 : 1,
            duration: const Duration(milliseconds: 180),
            child: const _LogoFallback(),
          ),
          Image.asset(
            'assets/icons/logo.png',
            fit: BoxFit.contain,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded || frame != null) {
                if (!_isAssetLoaded) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) {
                      setState(() => _isAssetLoaded = true);
                    }
                  });
                }

                return AnimatedOpacity(
                  opacity: 1,
                  duration: const Duration(milliseconds: 220),
                  child: child,
                );
              }

              return const SizedBox.shrink();
            },
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

class _LogoFallback extends StatelessWidget {
  const _LogoFallback();

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF1F6E2D);
    const gold = Color(0xFFD3AB35);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFE9F6DF),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 24,
            child: Container(
              width: 52,
              height: 10,
              decoration: BoxDecoration(
                color: gold.withValues(alpha: 0.28),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
          Container(
            width: 42,
            height: 54,
            decoration: BoxDecoration(
              color: green,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: green.withValues(alpha: 0.24),
                  blurRadius: 14,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
          ),
          Positioned(
            top: 31,
            child: Container(
              width: 18,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.92),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
