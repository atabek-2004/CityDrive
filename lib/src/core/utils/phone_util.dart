/// Нормализация телефонов Казахстана (+7XXXXXXXXXX).
abstract final class PhoneUtil {
  static String normalize(String phone) {
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return phone.trim();

    final String last10;
    if (digits.length >= 11 && digits.startsWith('7')) {
      last10 = digits.substring(digits.length - 10);
    } else if (digits.length == 10) {
      last10 = digits;
    } else if (digits.length > 10) {
      last10 = digits.substring(digits.length - 10);
    } else {
      return '+7$digits';
    }
    return '+7$last10';
  }

  static String digitsOnly(String phone) =>
      phone.replaceAll(RegExp(r'\D'), '');
}
