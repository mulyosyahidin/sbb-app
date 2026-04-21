import 'package:app/core/errors/failure.dart';
import 'package:app/features/partner/data/dtos/requests/register_partner_request_dto.dart';
import 'package:app/features/partner/data/dtos/requests/update_partner_request_dto.dart';
import 'package:app/features/partner/data/dtos/responses/check_partner_response_dto.dart';
import 'package:app/features/partner/data/dtos/responses/get_partner_response_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class PartnerRepository {
  Future<Either<Failure, CheckPartnerResponseData>> checkPartner();
  Future<Either<Failure, GetPartnerResponseData>> getPartner();
  Future<Either<Failure, GetPartnerResponseData>> registerPartner(
      RegisterPartnerRequestDto dto);
  Future<Either<Failure, GetPartnerResponseData>> updatePartner(
      UpdatePartnerRequestDto dto);
}
