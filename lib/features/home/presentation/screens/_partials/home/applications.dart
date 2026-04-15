import 'package:app/features/home/presentation/widgets/menu_card_widget.dart';
import 'package:flutter/material.dart';

class CardPartial extends StatelessWidget {
  const CardPartial({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = [
      {'icon': Icons.people_alt, 'label': 'Open Mitra'},
      {'icon': Icons.edit_document, 'label': 'Kontrak'},
      {'icon': Icons.trending_up, 'label': 'Profit'},
      {'icon': Icons.emoji_events, 'label': 'Reward'},
      {'icon': Icons.business, 'label': 'Profil'},
      {'icon': Icons.calculate, 'label': 'Kalkulator'},
      {'icon': Icons.photo_library_outlined, 'label': 'Gallery'},
      {'icon': Icons.grid_view, 'label': 'All Menu'},
    ];

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: menus
              .take(4)
              .map((m) => Expanded(child: MenuCardWidget(menu: m)))
              .toList(),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: menus
              .skip(4)
              .map((m) => Expanded(child: MenuCardWidget(menu: m)))
              .toList(),
        ),
      ],
    );
  }
}
