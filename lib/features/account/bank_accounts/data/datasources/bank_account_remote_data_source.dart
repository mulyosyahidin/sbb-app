import 'package:app/core/config/api_endpoint.dart';
import 'package:app/core/networks/dio_client.dart';
import 'package:app/core/utils/logger_util.dart';
import 'package:app/features/account/bank_accounts/data/dtos/requests/create_bank_account_request_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/requests/update_bank_account_request_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/responses/bank_accounts_response_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/responses/create_bank_account_response_dto.dart';
import 'package:app/features/account/bank_accounts/data/dtos/responses/mark_as_primary_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bank_account_remote_data_source.g.dart';

abstract class BankAccountRemoteDataSource {
  Future<BankAccountsResponseDto> getBankAccounts({
    int page = 1,
    int perPage = 10,
    String? search,
  });

  Future<MarkAsPrimaryResponseDto> markAsPrimary(String id);

  Future<CreateBankAccountResponseDto> createBankAccount(
      CreateBankAccountRequestDto dto);

  Future<CreateBankAccountResponseDto> updateBankAccount(
      String id, UpdateBankAccountRequestDto dto);

  Future<void> deleteBankAccount(String id);
}

class BankAccountRemoteDataSourceImpl implements BankAccountRemoteDataSource {
  final Dio _dio;

  BankAccountRemoteDataSourceImpl(this._dio);

  @override
  Future<BankAccountsResponseDto> getBankAccounts({
    int page = 1,
    int perPage = 10,
    String? search,
  }) async {
    const endpoint = ApiEndpoint.getAllPaginatedBankAccounts;

    try {
      LoggerUtil.api("GET", endpoint, queryParameters: {
        'page': page,
        'per_page': perPage,
        if (search != null) 'search': search,
      });

      final response = await _dio.get(endpoint, queryParameters: {
        'page': page,
        'per_page': perPage,
        if (search != null) 'search': search,
      });

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = BankAccountsResponseDto.fromJson(response.data);

      if (!responseDto.success) {
        throw responseDto.toException();
      }

      return responseDto;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        final dto = BankAccountsResponseDto.fromJson(e.response!.data);
        throw dto.toException();
      } else {
        rethrow;
      }
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }
  }

  @override
  Future<MarkAsPrimaryResponseDto> markAsPrimary(String id) async {
    final endpoint = ApiEndpoint.markAsPrimary.replaceAll('{id}', id);

    try {
      LoggerUtil.api("PATCH", endpoint);

      final response = await _dio.patch(endpoint);

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = MarkAsPrimaryResponseDto.fromJson(response.data);

      if (!responseDto.success) {
        throw responseDto.toException();
      }

      return responseDto;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        final dto = MarkAsPrimaryResponseDto.fromJson(e.response!.data);
        throw dto.toException();
      } else {
        rethrow;
      }
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }
  }

  @override
  Future<CreateBankAccountResponseDto> createBankAccount(
      CreateBankAccountRequestDto dto) async {
    const endpoint = ApiEndpoint.storeBankAccount;

    try {
      LoggerUtil.api(
        "POST",
        endpoint,
        data: dto.toJson(),
      );

      final response = await _dio.post(
        endpoint,
        data: dto.toJson(),
      );

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = CreateBankAccountResponseDto.fromJson(response.data);

      if (!responseDto.success) {
        throw responseDto.toException();
      }

      return responseDto;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        final dto = CreateBankAccountResponseDto.fromJson(e.response!.data);
        throw dto.toException();
      } else {
        rethrow;
      }
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }
  }

  @override
  Future<CreateBankAccountResponseDto> updateBankAccount(
      String id, UpdateBankAccountRequestDto dto) async {
    final endpoint = ApiEndpoint.updateBankAccount.replaceAll('{id}', id);

    try {
      LoggerUtil.api(
        "PUT",
        endpoint,
        data: dto.toJson(),
      );

      final response = await _dio.put(
        endpoint,
        data: dto.toJson(),
      );

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      final responseDto = CreateBankAccountResponseDto.fromJson(response.data);

      if (!responseDto.success) {
        throw responseDto.toException();
      }

      return responseDto;
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");

      if (e.response?.data != null &&
          e.response?.data is Map<String, dynamic>) {
        final dto = CreateBankAccountResponseDto.fromJson(e.response!.data);
        throw dto.toException();
      } else {
        rethrow;
      }
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }
  }

  @override
  Future<void> deleteBankAccount(String id) async {
    final endpoint = ApiEndpoint.deleteBankAccount.replaceAll('{id}', id);

    try {
      LoggerUtil.api("DELETE", endpoint);

      final response = await _dio.delete(endpoint);

      if (response.data is! Map<String, dynamic>) {
        throw const FormatException("Invalid response format");
      }

      // No special DTO needed for delete if it only returns success:true
    } on DioException catch (e) {
      LoggerUtil.error("Api Error on endpoint $endpoint: ${e.message}");
      rethrow;
    } catch (e) {
      LoggerUtil.error("Unexpected error on endpoint $endpoint: $e");
      rethrow;
    }
  }
}

@riverpod
BankAccountRemoteDataSource bankAccountRemoteDataSource(Ref ref) {
  return BankAccountRemoteDataSourceImpl(
    ref.watch(dioProvider),
  );
}
