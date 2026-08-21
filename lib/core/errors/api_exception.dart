class ApiException implements Exception {
  final String message;
  final Map<String, String>? errors;

  const ApiException(this.message, {this.errors});

  @override
  String toString() => message;
}
