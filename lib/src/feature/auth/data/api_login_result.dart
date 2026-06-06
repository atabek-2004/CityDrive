import 'package:city_drive/src/feature/auth/models/user_dto.dart';

class ApiLoginResult {
  const ApiLoginResult({
    required this.user,
    required this.role,
    this.isApproved = true,
  });

  final UserDTO user;
  final String role;
  final bool isApproved;
}
