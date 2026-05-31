import 'package:city_drive/src/core/local_storage/user_role.dart';

class LocalUser {
  const LocalUser({
    required this.id,
    required this.phone,
    required this.password,
    required this.fullName,
    required this.role,
    this.cityId,
  });

  final int id;
  final String phone;
  final String password;
  final String fullName;
  final UserRole role;
  final int? cityId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'phone': phone,
        'password': password,
        'fullName': fullName,
        'role': role.value,
        'cityId': cityId,
      };

  factory LocalUser.fromJson(Map<String, dynamic> json) => LocalUser(
        id: (json['id'] as num).toInt(),
        phone: json['phone'] as String,
        password: json['password'] as String,
        fullName: json['fullName'] as String,
        role: UserRole.fromString(json['role'] as String?),
        cityId: (json['cityId'] as num?)?.toInt(),
      );

  LocalUser copyWith({
    int? id,
    String? phone,
    String? password,
    String? fullName,
    UserRole? role,
    int? cityId,
  }) =>
      LocalUser(
        id: id ?? this.id,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        fullName: fullName ?? this.fullName,
        role: role ?? this.role,
        cityId: cityId ?? this.cityId,
      );
}
