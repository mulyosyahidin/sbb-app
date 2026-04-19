import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final String? code;
  const ServerFailure(super.message, {this.code});

  @override
  List<Object?> get props => [message, code];
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);
}

class ValidationFailure extends Failure {
  final Map<String, String>? errors;
  const ValidationFailure(super.message, {this.errors});

  @override
  List<Object?> get props => [message, errors];
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
