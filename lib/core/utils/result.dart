class Result<T> {
  final T? value;
  final Exception? error;

  Result({this.value, this.error});

  factory Result.success(T value) => Result(value: value);
  factory Result.failure(Exception error) => Result(error: error);

  bool get isSuccess => value != null;
  bool get isFailure => error != null;
}