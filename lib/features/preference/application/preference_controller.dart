import 'package:app/features/preference/data/mappers/company_bank_account_mapper.dart';
import 'package:app/features/preference/data/repositories/preference_repository_impl.dart';
import 'package:app/features/preference/domain/entities/company_bank_account.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preference_controller.g.dart';

@Riverpod(keepAlive: true)
Future<CompanyBankAccount?> companyBankAccount(Ref ref) async {
  final repository = ref.watch(preferenceRepositoryProvider);
  final result = await repository.getCompanyBankAccount();

  return result.fold(
    (failure) => null,
    (data) => CompanyBankAccountMapper.toEntity(data.bankAccount),
  );
}
