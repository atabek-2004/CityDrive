/// Backend Spring Boot (city_drive_admin). Same Wi‑Fi as the phone.
///
/// Актуальный URL: GET http://<IP-backend>:8080/api/info → `flutter_base_url`
///
/// | Device              | baseUrl                          |
/// |---------------------|----------------------------------|
/// | Phone / other PC    | http://10.201.122.134:8080/api   |
/// | Android emulator    | http://10.0.2.2:8080/api         |
/// | iOS simulator       | http://localhost:8080/api        |
abstract final class ApiConfig {
  static const baseUrl = 'http://93.115.23.239:8080/api';
}
