import 'package:app/core/theme/app_text_style.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Profil Perusahaan',
              subtitle: 'Mengenal lebih dekat Sarana Bahagia Berkah',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeroSection(context),
                    const SizedBox(height: 32),
                    _buildSectionTitle(context, 'Tentang Kami'),
                    const SizedBox(height: 12),
                    _buildAboutCard(context),
                    const SizedBox(height: 32),
                    _buildSectionTitle(context, 'Visi & Misi'),
                    const SizedBox(height: 12),
                    _buildVisionMissionCard(context),
                    const SizedBox(height: 32),
                    _buildSectionTitle(context, 'Keunggulan'),
                    const SizedBox(height: 12),
                    _buildKeunggulanCard(context),
                    const SizedBox(height: 32),
                    _buildSectionTitle(context, 'Mitra Kami'),
                    const SizedBox(height: 12),
                    _buildMitraCard(context),
                    const SizedBox(height: 32),
                    _buildSectionTitle(context, 'Legalitas'),
                    const SizedBox(height: 12),
                    _buildLegalitasCard(context),
                    const SizedBox(height: 32),
                    _buildSectionTitle(context, 'Hubungi Kami'),
                    const SizedBox(height: 12),
                    _buildContactCard(context),
                    const SizedBox(height: 48),
                    _buildFooter(context),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .primaryContainer
            .withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: AssetImage('assets/images/galleries/kandang-sapi-sbb-1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.6),
            ],
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sarana Bahagia Berkah',
              style: AppTextStyles.title(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              'Wujudkan Impianmu dengan Aset yang Nyata',
              style: AppTextStyles.body(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextStyles.title(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildAboutCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
            color:
                Theme.of(context).colorScheme.outline.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        'PT. Sarana Bahagia Berkah (PT. SBB) secara resmi didirikan pada tanggal 25 Juli 2024, menandai langkah awal kami dalam industri perdagangan sapi potong. Fokus utama PT. Sarana Bahagia Berkah adalah membangun jaringan perdagangan sapi potong yang kuat dan efisien, berkontribusi pada pemenuhan kebutuhan protein hewani di pasar domestik.\n\nUntuk memperkuat posisi dan operasional kami, PT. Sarana Bahagia Berkah menjalin kerja sama strategis dengan PT. Pasir Tengah Farm, PT. Hade Dinamis Sejahtera, dan PT. Cianjur Arta Makmur.',
        style: AppTextStyles.body(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 14,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildVisionMissionCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBulletItem(
            context,
            Icons.explore_outlined,
            'Visi',
            'Meningkatkan kuantitas daging sapi yang berkualitas di seluruh pasar-pasar Nusantara dan menjadi solusi finansial jangka pendek maupun jangka panjang terhadap mitra bisnis.',
          ),
          const SizedBox(height: 24),
          _buildBulletItem(
            context,
            Icons.auto_awesome_outlined,
            'Misi',
            '1. Membangun jaringan marketing di bidang usaha peternakan sapi potong.\n2. Membangun jaringan distribusi dan perdagangan hasil peternakan sapi potong secara langsung di jantung pasar.\n3. Membangun usaha peternakan sapi potong.\n4. Membangun usaha pengolahan daging sapi.',
          ),
        ],
      ),
    );
  }

  Widget _buildKeunggulanCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final keunggulan = [
      ('Model Bisnis yang Mudah dan Menguntungkan', Icons.trending_up_rounded),
      ('Kemitraan dan Ekosistem Bisnis yang Kuat', Icons.handshake_outlined),
      ('Nilai Tambah dan Insentif yang Menarik', Icons.star_outline_rounded),
      ('Tim Profesional dan Pengelolaan yang Efisien', Icons.groups_outlined),
      ('Legalitas dan Jaminan Keamanan yang Teruji', Icons.verified_outlined),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: keunggulan.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(item.$2, color: colorScheme.primary, size: 18),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    item.$1,
                    style: AppTextStyles.body(
                      fontSize: 14,
                      color: colorScheme.onSurface,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMitraCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final mitra = [
      (
        'PT. Hade Dinamis Sejahtera',
        'Bergerak di bidang pembibitan dan penggemukan sapi potong dengan kapasitas penggemukan 35.000 ekor sapi. Berlokasi di Subang, Jawa Barat.',
        Icons.agriculture_outlined,
      ),
      (
        'PT. Pasir Tengah Farm',
        'Mengoperasikan peternakan sapi terintegrasi terbesar di Indonesia, mencakup penggemukan, pembiakan, pabrik pakan, hingga pengolahan limbah menjadi pupuk organik. Kandang Cianjur seluas 130 Ha (26.000–31.500 ekor) dan Cariu seluas 35 Ha (12.000 ekor).',
        Icons.park_outlined,
      ),
      (
        'PT. Cianjur Arta Makmur',
        'Mengoperasikan Rumah Potong Hewan (RPH) modern terbesar di Indonesia. Memproduksi berbagai makanan olahan berbahan daging sapi dan ayam yang didistribusikan ke seluruh negeri, supermarket, dan sektor perhotelan.',
        Icons.store_outlined,
      ),
    ];

    return Column(
      children: mitra.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.$3, color: colorScheme.primary, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.$1,
                      style: AppTextStyles.title(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.$2,
                      style: AppTextStyles.body(
                        fontSize: 13,
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLegalitasCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final items = [
      ('Nomor Induk Berusaha (NIB)', '2607240089763'),
      ('SK Kemenkumham RI', 'AHU-0153714.AH.01.11.TAHUN 2024'),
      ('NPWP', '21.243.244.7-061.000'),
      ('Akta Notaris', 'Hasbi Amrilah, S.H., M.Kn. — No. 08, 25 Juli 2024'),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle_outline,
                    color: colorScheme.primary, size: 18),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.$1,
                        style: AppTextStyles.body(
                          fontSize: 12,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        item.$2,
                        style: AppTextStyles.body(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBulletItem(
      BuildContext context, IconData icon, String title, String content) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: colorScheme.primary, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.title(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: AppTextStyles.body(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          _buildContactTile(
            context,
            Icons.chat_bubble_outline_rounded,
            'WhatsApp',
            '0813 1609 4806 | 0821 2212 045',
            onTap: () {},
          ),
          const Divider(height: 1),
          _buildContactTile(
            context,
            Icons.mail_outline_rounded,
            'Email',
            'sbb.divisi.sapipotong@gmail.com',
            onTap: () {},
          ),
          const Divider(height: 1),
          _buildContactTile(
            context,
            Icons.location_on_outlined,
            'Kantor Pusat',
            'Cyber 2 Tower Lt. 22, Jl. H. R. Rasuna Said No. 13, Kuningan, Jakarta Selatan',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile(
    BuildContext context,
    IconData icon,
    String title,
    String value, {
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: colorScheme.primary, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body(
                      fontSize: 12,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    value,
                    style: AppTextStyles.body(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: colorScheme.outline),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Sarana Bahagia Berkah v1.0.0',
            style: AppTextStyles.body(
              fontSize: 11,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '© 2026 PT. Sarana Bahagia Berkah',
            style: AppTextStyles.body(
              fontSize: 11,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}
