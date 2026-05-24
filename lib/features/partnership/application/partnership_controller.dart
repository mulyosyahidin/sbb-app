import 'dart:async';
import 'dart:io';

import 'package:app/core/models/pagination_dto.dart';
import 'package:app/features/partnership/data/dtos/requests/store_partnership_application_request_dto.dart';
import 'package:app/features/partnership/data/dtos/requests/update_partnership_application_request_dto.dart';
import 'package:app/features/partnership/data/mappers/partnership_mapper.dart';
import 'package:app/features/partnership/data/repositories/partnership_repository_impl.dart';
import 'package:app/features/partnership/domain/entities/partnership.dart';
import 'package:app/features/partnership/domain/entities/partnership_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partnership_controller.g.dart';

class PartnerState {
  final bool hasPartner;
  final int? level;
  final String? levelLabel;
  final Partner? partnership;
  final PartnershipApplication? pendingApplication;

  const PartnerState({
    required this.hasPartner,
    this.level,
    this.levelLabel,
    this.partnership,
    this.pendingApplication,
  });
}

class PartnershipApplicationsState {
  final List<PartnershipApplication> applications;
  final PaginationDto? pagination;

  const PartnershipApplicationsState({
    required this.applications,
    this.pagination,
  });
}

@Riverpod(keepAlive: true)
class PartnerController extends _$PartnerController {
  @override
  Future<PartnerState> build() async {
    return _checkPartnership();
  }

  Future<PartnerState> _checkPartnership() async {
    final repository = ref.read(partnershipRepositoryProvider);
    final result = await repository.checkPartnership();

    return result.fold(
      (failure) => throw failure,
      (data) => PartnerState(
        hasPartner: data.hasPartner,
        level: data.level,
        levelLabel: data.levelLabel,
        partnership: data.partnership == null
            ? null
            : PartnershipMapper.toEntity(data.partnership!),
        pendingApplication: data.pendingApplication == null
            ? null
            : PartnershipMapper.applicationToEntity(data.pendingApplication!),
      ),
    );
  }

  Future<void> checkPartner() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_checkPartnership);
  }
}

@riverpod
class PartnershipApplicationsController
    extends _$PartnershipApplicationsController {
  @override
  Future<PartnershipApplicationsState> build() async {
    final repository = ref.read(partnershipRepositoryProvider);
    final result = await repository.getApplications();

    return result.fold(
      (failure) => throw failure,
      (data) => PartnershipApplicationsState(
        applications: data.applications
            .map(PartnershipMapper.applicationToEntity)
            .toList(),
        pagination: data.pagination,
      ),
    );
  }
}

@riverpod
class PartnershipApplicationCreateController
    extends _$PartnershipApplicationCreateController {
  @override
  FutureOr<void> build() {}

  Future<void> create({
    required int level,
    required String name,
    required String nik,
    required String address,
    required File identityCardFile,
    String? note,
  }) async {
    state = const AsyncLoading();

    final repository = ref.read(partnershipRepositoryProvider);
    final result = await repository.storeApplication(
      StorePartnershipApplicationRequestDto(
        level: level,
        name: name,
        nik: nik,
        address: address,
        identityCardFile: identityCardFile,
        note: note,
      ),
    );

    result.fold(
      (failure) => state = AsyncError(failure, StackTrace.current),
      (_) {
        state = const AsyncData(null);
        ref.invalidate(partnerControllerProvider);
        ref.invalidate(partnershipApplicationsControllerProvider);
      },
    );
  }

  Future<void> updateApplication({
    required int id,
    required String name,
    required String nik,
    required String address,
    File? identityCardFile,
    String? note,
  }) async {
    state = const AsyncLoading();

    final repository = ref.read(partnershipRepositoryProvider);
    final result = await repository.updateApplication(
      id: id,
      request: UpdatePartnershipApplicationRequestDto(
        name: name,
        nik: nik,
        address: address,
        identityCardFile: identityCardFile,
        note: note,
      ),
    );

    result.fold(
      (failure) => state = AsyncError(failure, StackTrace.current),
      (_) {
        state = const AsyncData(null);
        ref.invalidate(partnerControllerProvider);
        ref.invalidate(partnershipApplicationsControllerProvider);
      },
    );
  }
}
