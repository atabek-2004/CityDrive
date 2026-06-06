enum UserRole {
  resident,
  controller;

  String get value => name;

  static UserRole fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'controller':
        return UserRole.controller;
      case 'admin':
        return UserRole.controller;
      case 'resident':
      default:
        return UserRole.resident;
    }
  }
}
