import 'package:equatable/equatable.dart';

class CowMeta extends Equatable {
  final String key;
  final String value;

  const CowMeta({
    required this.key,
    required this.value,
  });

  @override
  List<Object?> get props => [key, value];
}
