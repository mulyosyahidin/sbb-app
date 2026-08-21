import 'package:equatable/equatable.dart';

class AppFile extends Equatable {
  final int id;
  final int? userId;
  final String fileName;
  final String fileType;
  final int fileSize;
  final String fileUrl;

  const AppFile({
    required this.id,
    this.userId,
    required this.fileName,
    required this.fileType,
    required this.fileSize,
    required this.fileUrl,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        fileName,
        fileType,
        fileSize,
        fileUrl,
      ];
}
