import 'package:app/core/errors/api_exception.dart';
import 'package:app/core/errors/failure.dart';
import 'package:app/features/partner/data/datasources/partner_remote_data_source.dart';
import 'package:app/features/partner/data/dtos/requests/register_partner_request_dto.dart';
import 'package:app/features/partner/data/dtos/requests/update_partner_request_dto.dart';
import 'package:app/features/partner/data/dtos/responses/check_partner_response_dto.dart';
import 'package:app/features/partner/data/dtos/responses/get_partner_response_dto.dart';
import 'package:app/features/partner/domain/repositories/partner_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partner_repository_impl.g.dart';

class PartnerRepositoryImpl implements PartnerRepository {
  final PartnerRemoteDataSource _dataSource;

  PartnerRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, CheckPartnerResponseData>> checkPartner() async {
    try {
      final response = await _dataSource.checkPartner();
      return Right(response.data!);
    } on ApiException catch (e) {
      return Left(
        ServerFailure(e.message),
      );
    } catch (e) {
      return Left(ServerFailure(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, GetPartnerResponseData>> getPartner() async {
    try {
      final response = await _dataSource.getPartner();
      return Right(response.data!);
    } on ApiException catch (e) {
      return Left(
        ServerFailure(e.message),
      );
    } catch (e) {
      return Left(ServerFailure(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, GetPartnerResponseData>> registerPartner(
      RegisterPartnerRequestDto dto) async {
    try {
      final response = await _dataSource.registerPartner(dto);
      return Right(response.data!);
    } on ApiException catch (e) {
      if (e.errors != null) {
        return Left(
          ValidationFailure(e.message, errors: e.errors),
        );
      }
      return Left(
        ServerFailure(e.message),
      );
    } catch (e) {
      return Left(ServerFailure(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, GetPartnerResponseData>> updatePartner(
      UpdatePartnerRequestDto dto) async {
    try {
      final response = await _dataSource.updatePartner(dto);
      return Right(response.data!);
    } on ApiException catch (e) {
      if (e.errors != null) {
        return Left(
          ValidationFailure(e.message, errors: e.errors),
        );
      }
      return Left(
        ServerFailure(e.message),
      );
    } catch (e) {
      return Left(ServerFailure(
        e.toString(),
      ));
    }
  }
}

@riverpod
PartnerRepository partnerRepository(Ref ref) {
  return PartnerRepositoryImpl(
    ref.watch(partnerRemoteDataSourceProvider),
  );
}
