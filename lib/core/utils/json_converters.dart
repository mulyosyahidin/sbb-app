import 'package:freezed_annotation/freezed_annotation.dart';

class DoubleStringConverter implements JsonConverter<double?, dynamic> {
  const DoubleStringConverter();

  @override
  double? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is num) return json.toDouble();
    if (json is String) return double.tryParse(json);
    return null;
  }

  @override
  dynamic toJson(double? object) => object;
}

class IntStringConverter implements JsonConverter<int?, dynamic> {
  const IntStringConverter();

  @override
  int? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is int) return json;
    if (json is num) return json.toInt();
    if (json is String) return int.tryParse(json);
    return null;
  }

  @override
  dynamic toJson(int? object) => object;
}
