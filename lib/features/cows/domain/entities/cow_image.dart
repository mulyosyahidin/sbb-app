import 'package:equatable/equatable.dart';

class CowImage extends Equatable {
  final int id;
  final String url;

  const CowImage({
    required this.id,
    required this.url,
  });

  @override
  List<Object?> get props => [id, url];
}
