import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/config/env.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:app/shared/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CompanyProfilePage extends StatefulWidget {
  const CompanyProfilePage({super.key});

  @override
  State<CompanyProfilePage> createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    final baseUrl = Env.apiBaseUrl.endsWith('/api')
        ? Env.apiBaseUrl.substring(0, Env.apiBaseUrl.length - 4)
        : Env.apiBaseUrl;

    final url = baseUrl + ApiEndpoint.companyProfileWebView;

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() => _isLoading = true);
          },
          onPageFinished: (url) {
            setState(() => _isLoading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Profil Perusahaan',
              subtitle: 'Mengenal lebih dekat Sarana Bahagia Berkah',
            ),
            Expanded(
              child: Stack(
                children: [
                  WebViewWidget(controller: _controller),
                  if (_isLoading) const _CompanyProfileWebViewSkeleton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CompanyProfileWebViewSkeleton extends StatelessWidget {
  const _CompanyProfileWebViewSkeleton();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 28),
        children: const [
          _WebHeroSkeleton(),
          SizedBox(height: 18),
          _ParagraphBlockSkeleton(lineCount: 4),
          SizedBox(height: 18),
          _ImageBlockSkeleton(),
          SizedBox(height: 18),
          _ParagraphBlockSkeleton(lineCount: 5),
          SizedBox(height: 18),
          _TwoColumnSkeleton(),
        ],
      ),
    );
  }
}

class _WebHeroSkeleton extends StatelessWidget {
  const _WebHeroSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeleton(width: 86, height: 12, borderRadius: 6),
            SizedBox(height: 14),
            Skeleton(height: 30, borderRadius: 8),
            SizedBox(height: 10),
            Skeleton(width: 240, height: 30, borderRadius: 8),
            SizedBox(height: 18),
            Skeleton(height: 13, borderRadius: 6),
            SizedBox(height: 8),
            Skeleton(width: 260, height: 13, borderRadius: 6),
            SizedBox(height: 20),
            Skeleton(width: 132, height: 38, borderRadius: 12),
          ],
        ),
      ),
    );
  }
}

class _ParagraphBlockSkeleton extends StatelessWidget {
  final int lineCount;

  const _ParagraphBlockSkeleton({
    required this.lineCount,
  });

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Skeleton(width: 150, height: 18, borderRadius: 7),
            const SizedBox(height: 16),
            ...List.generate(
              lineCount,
              (index) => Padding(
                padding:
                    EdgeInsets.only(bottom: index == lineCount - 1 ? 0 : 9),
                child: Skeleton(
                  width: index == lineCount - 1 ? 220 : null,
                  height: 13,
                  borderRadius: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageBlockSkeleton extends StatelessWidget {
  const _ImageBlockSkeleton();

  @override
  Widget build(BuildContext context) {
    return const AppShimmer(
      child: Skeleton(height: 180, borderRadius: 18),
    );
  }
}

class _TwoColumnSkeleton extends StatelessWidget {
  const _TwoColumnSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: AppShimmer(
            child: Skeleton(height: 112, borderRadius: 16),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: AppShimmer(
            child: Skeleton(height: 112, borderRadius: 16),
          ),
        ),
      ],
    );
  }
}
