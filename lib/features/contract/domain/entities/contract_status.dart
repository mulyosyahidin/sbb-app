enum ContractStatus {
  draft('Draft'),
  waitingVerification('Menunggu Verifikasi'),
  waitingPayment('Menunggu Pembayaran'),
  active('Aktif'),
  extended('Diperpanjang'),
  completed('Selesai'),
  cancelled('Dibatalkan'),
  rejected('Ditolak');

  final String value;
  const ContractStatus(this.value);

  static ContractStatus fromString(String? value) {
    return ContractStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => ContractStatus.draft,
    );
  }
}
