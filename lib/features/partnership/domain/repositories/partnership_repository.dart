import 'package:app/core/errors/failure.dart';
import 'package:app/features/partnership/data/dtos/requests/store_partnership_application_request_dto.dart';
import 'package:app/features/partnership/data/dtos/requests/update_partnership_application_request_dto.dart';
import 'package:app/features/partnership/data/dtos/responses/check_partnership_response.dart';
import 'package:app/features/partnership/data/dtos/responses/get_partnership_applications_response.dart';
import 'package:app/features/partnership/data/dtos/responses/partnership_application_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class PartnershipRepository {
  Future<Either<Failure, CheckPartnershipResponseData>> checkPartnership();
  Future<Either<Failure, GetPartnershipApplicationsResponseData>>
      getApplications({int perPage = 10});
  Future<Either<Failure, PartnershipApplicationResponseData>> storeApplication(
    StorePartnershipApplicationRequestDto request,
  );
  Future<Either<Failure, PartnershipApplicationResponseData>>
      getApplicationById(int id);
  Future<Either<Failure, PartnershipApplicationResponseData>>
      updateApplication({
    required int id,
    required UpdatePartnershipApplicationRequestDto request,
  });
}
