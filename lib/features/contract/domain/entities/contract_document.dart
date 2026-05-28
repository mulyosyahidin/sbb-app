import 'package:app/core/domain/entities/app_file.dart';
import 'package:equatable/equatable.dart';

class ContractDocument extends Equatable {
  final int id;
  final int contractId;
  final int fileId;
  final AppFile? file;
  final String status;
  final String? note;
  final DateTime? verifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ContractDocument({
    required this.id,
    required this.contractId,
    required this.fileId,
    this.file,
    required this.status,
    this.note,
    this.verifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        contractId,
        fileId,
        file,
        status,
        note,
        verifiedAt,
        createdAt,
        updatedAt,
      ];
}
