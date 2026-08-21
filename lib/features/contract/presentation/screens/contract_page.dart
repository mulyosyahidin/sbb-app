import 'package:app/core/errors/failure.dart';
import 'package:app/features/contract/application/contract_detail_controller.dart';
import 'package:app/features/contract/domain/entities/contract.dart';
import 'package:app/features/contract/domain/entities/contract_status.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/active_contract_detail_partial.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/cancelled_contract_detail_partial.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/completed_contract_detail_partial.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/contract_detail_skeleton_partial.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/extended_contract_detail_partial.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/payment_rejected_contract_detail_partial.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/rejected_contract_detail_partial.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/waiting_payment_contract_detail_partial.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/waiting_payment_verification_contract_detail_partial.dart';
import 'package:app/features/contract/presentation/screens/partials/contract_detail/waiting_verification_contract_detail_partial.dart';
import 'package:app/shared/widgets/app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContractPage extends ConsumerWidget {
  final String contractId;
  final Contract? initialContract;

  const ContractPage({
    super.key,
    required this.contractId,
    this.initialContract,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contractState =
        ref.watch(contractDetailControllerProvider(contractId));

    return contractState.when(
      data: _buildStatusPage,
      loading: () => ContractDetailSkeletonPartial(
        status: initialContract?.status,
      ),
      error: (error, stackTrace) => _ContractDetailErrorPage(error: error),
    );
  }

  Widget _buildStatusPage(Contract contract) {
    switch (contract.status) {
      case ContractStatus.waitingVerification:
        return WaitingVerificationContractDetailPartial(contract: contract);
      case ContractStatus.waitingPaymentVerification:
        return WaitingPaymentVerificationContractDetailPartial(
            contract: contract);
      case ContractStatus.waitingPayment:
        return WaitingPaymentContractDetailPartial(contract: contract);
      case ContractStatus.paymentRejected:
        return PaymentRejectedContractDetailPartial(contract: contract);
      case ContractStatus.active:
        return ActiveContractDetailPartial(contract: contract);
      case ContractStatus.extended:
        return ExtendedContractDetailPartial(contract: contract);
      case ContractStatus.completed:
        return CompletedContractDetailPartial(contract: contract);
      case ContractStatus.cancelled:
        return CancelledContractDetailPartial(contract: contract);
      case ContractStatus.rejected:
        return RejectedContractDetailPartial(contract: contract);
      case ContractStatus.draft:
        return const SizedBox.shrink();
    }
  }
}

class _ContractDetailErrorPage extends StatelessWidget {
  final Object error;

  const _ContractDetailErrorPage({
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    final message = error is Failure
        ? (error as Failure).message
        : 'Gagal mendapatkan detail kontrak';

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppBarHeader(
              title: 'Detail Kontrak',
              subtitle: 'Terjadi kesalahan',
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
