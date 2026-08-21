enum ContractProgram {
  regular('Reguler'),
  ppm('PPM'),
  umroh('Umroh');

  final String value;
  const ContractProgram(this.value);

  static ContractProgram fromString(String? value) {
    return ContractProgram.values.firstWhere(
      (e) => e.value == value,
      orElse: () => ContractProgram.regular,
    );
  }
}
