import 'package:equatable/equatable.dart';

class ContractNote extends Equatable {
  final int id;
  final int userId;
  final int contractId;
  final String note;
  final Map<String, dynamic>? dataAfter;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ContractNote({
    required this.id,
    required this.userId,
    required this.contractId,
    required this.note,
    this.dataAfter,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        contractId,
        note,
        dataAfter,
        createdAt,
        updatedAt,
      ];
}
