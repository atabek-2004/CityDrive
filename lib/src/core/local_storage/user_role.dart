enum UserRole {
  resident,
  controller;

  String get value => name;

  static UserRole fromString(String? value) {
    switch (value) {
      case 'controller':
        return UserRole.controller;
      case 'resident':
      default:
        return UserRole.resident;
    }
  }
}
