import 'package:app/core/dtos/app_file_dto.dart';
import 'package:app/core/domain/entities/app_file.dart';

class AppFileMapper {
  static AppFile toEntity(AppFileDto dto) {
    return AppFile(
      id: dto.id,
      userId: dto.userId,
      fileName: dto.fileName,
      fileType: dto.fileType,
      fileSize: dto.fileSize,
      fileUrl: dto.fileUrl,
    );
  }
}
