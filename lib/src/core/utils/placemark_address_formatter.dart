import 'package:geocoding/geocoding.dart';

String? _pick(String? value) {
  if (value == null) return null;
  final trimmed = value.trim();
  return trimmed.isEmpty ? null : trimmed;
}

/// Собирает человекочитаемый адрес из полей [Placemark] (Android/iOS, KZ/RU).
String formatPlacemarkAddress(Placemark place) {
  final street =
      _pick(place.thoroughfare) ?? _pick(place.street) ?? _pick(place.name);
  final house = _pick(place.subThoroughfare);
  final district = _pick(place.subLocality);
  final city = _pick(place.locality) ?? _pick(place.administrativeArea);

  final parts = <String>[];

  if (street != null && house != null) {
    parts.add('$street, $house');
  } else if (street != null) {
    parts.add(street);
  } else if (house != null) {
    parts.add(house);
  }

  if (parts.isEmpty) {
    for (final candidate in [
      place.thoroughfare,
      place.street,
      place.name,
      place.subLocality,
      place.locality,
      place.administrativeArea,
      place.country,
    ]) {
      final value = _pick(candidate);
      if (value != null && !parts.contains(value)) {
        parts.add(value);
      }
    }
  } else if (district != null && !parts.first.contains(district)) {
    parts.add(district);
  }

  if (city != null) {
    final joined = parts.join(', ');
    if (!joined.toLowerCase().contains(city.toLowerCase())) {
      parts.add(city);
    }
  }

  return parts.join(', ');
}

bool isLikelyInvalidAddress(String? address) {
  if (address == null) return true;
  final trimmed = address.trim();
  if (trimmed.isEmpty) return true;
  if (trimmed == ',' || trimmed.startsWith(', ')) return true;
  if (RegExp(r'^[\s,]+$').hasMatch(trimmed)) return true;
  return false;
}

Future<String> resolveAddressFromCoordinates(
  double latitude,
  double longitude, {
  String localeIdentifier = 'ru_KZ',
}) async {
  try {
    await setLocaleIdentifier(localeIdentifier);
    final placemarks = await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      final formatted = formatPlacemarkAddress(placemarks.first);
      if (formatted.isNotEmpty) return formatted;
    }
  } catch (_) {
    // fallback to coordinates below
  }
  return '${latitude.toStringAsFixed(5)}, ${longitude.toStringAsFixed(5)}';
}
