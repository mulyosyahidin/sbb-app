import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/preference/data/dtos/responses/get_company_bank_account_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preference_remote_data_source.g.dart';

abstract class PreferenceRemoteDataSource {
  Future<GetCompanyBankAccountResponseDto> getCompanyBankAccount();
}

class PreferenceRemoteDataSourceImpl implements PreferenceRemoteDataSource {
  final Dio _dio;

  PreferenceRemoteDataSourceImpl(this._dio);

  @override
  Future<GetCompanyBankAccountResponseDto> getCompanyBankAccount() async {
    const endpoint = ApiEndpoint.preferenceBankAccount;
    GetCompanyBankAccountResponseDto? responseDto;

    try {
      LoggerUtil.api("GET", endpoint);
      final response = await _dio.get(endpoint);
      responseDto = GetCompanyBankAccountResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      if (e.response != null) {
        responseDto = GetCompanyBankAccountResponseDto.fromJson(e.response!.data);
      }
    }

    if (responseDto != null) {
      if (responseDto.success && responseDto.data != null) {
        return responseDto;
      } else {
        throw responseDto.toException();
      }
    }

    throw Exception('Gagal mendapatkan data rekening bank perusahaan');
  }
}

@riverpod
PreferenceRemoteDataSource preferenceRemoteDataSource(Ref ref) {
  return PreferenceRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
