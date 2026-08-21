import 'package:equatable/equatable.dart';

class UserActivity extends Equatable {
  final int id;
  final String iconName;
  final String color;
  final String title;
  final String description;
  final String? highlightedText;
  final Map<String, dynamic>? data;
  final DateTime createdAt;

  const UserActivity({
    required this.id,
    required this.iconName,
    required this.color,
    required this.title,
    required this.description,
    this.highlightedText,
    this.data,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        iconName,
        color,
        title,
        description,
        highlightedText,
        data,
        createdAt,
      ];
}
