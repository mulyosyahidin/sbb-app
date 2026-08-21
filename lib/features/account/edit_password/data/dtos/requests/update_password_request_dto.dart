import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_password_request_dto.freezed.dart';
part 'update_password_request_dto.g.dart';

@freezed
abstract class UpdatePasswordRequestDto with _$UpdatePasswordRequestDto {
  const factory UpdatePasswordRequestDto({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirmation,
  }) = _UpdatePasswordRequestDto;

  factory UpdatePasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestDtoFromJson(json);
}
