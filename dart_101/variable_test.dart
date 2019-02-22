import 'package:test/test.dart';

void main() {
  group('define variable', () {
    test('using var and type', () {
      String name = "Kyungkoo";
      var age = 35;

      expect(name.runtimeType, equals(String));
      expect(age.runtimeType, equals(int));
    });

    test('using dynamic and Object', () {
      dynamic countryCode = 82;
      Object pi = 3.14;

      expect(countryCode.runtimeType, equals(int));
      expect(pi.runtimeType, equals(double));

      countryCode = "+82";
      pi = "3.141592...";

      expect(countryCode.runtimeType, equals(String));
      expect(pi.runtimeType, equals(String));
    });
  });
}