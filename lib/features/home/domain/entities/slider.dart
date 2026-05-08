import 'package:equatable/equatable.dart';

class Slider extends Equatable {
  final int id;
  final String tag;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String? url;
  final int sequence;

  const Slider({
    required this.id,
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.url,
    required this.sequence,
  });

  @override
  List<Object?> get props => [
        id,
        tag,
        title,
        subtitle,
        imageUrl,
        url,
        sequence,
      ];
}
