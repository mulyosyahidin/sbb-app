import 'package:app/core/models/api_response_dto.dart';

class RefreshAccessTokenResponseData {
  final String accessToken;

  RefreshAccessTokenResponseData({required this.accessToken});

  factory RefreshAccessTokenResponseData.fromJson(Map<String, dynamic> json) {
    return RefreshAccessTokenResponseData(
      accessToken: json['access_token'],
    );
  }
}

class RefreshAccessTokenResponseDto extends ApiResponseDto<RefreshAccessTokenResponseData> {
  RefreshAccessTokenResponseDto({
    required super.success,
    required super.message,
    required super.data,
  });

  factory RefreshAccessTokenResponseDto.fromJson(Map<String, dynamic> json) {
    final base = ApiResponseDto.fromJson(
      json,
      (data) => RefreshAccessTokenResponseData.fromJson(data as Map<String, dynamic>),
    );

    return RefreshAccessTokenResponseDto(
      success: base.success,
      message: base.message,
      data: base.data,
    );
  }
}