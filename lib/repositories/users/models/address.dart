import 'models.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Coordinates geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  @override
  String toString() {
    return '$zipcode, $city, $street, $suite';
  }
}
