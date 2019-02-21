# 변수

다트는 다음과 같이 다양한 방식으로 변수를 선언할 수 있다.

```dart
String name = "Kyungkoo";
var age = 35;
dynamic countryCode = 82;
Object pi = 3.14;
```

다트는 다른언어와 마찬가지로 변수를 선언할 때 타입을 지정할 수 있다. 위 경우 `String` 타입을 선언하여 `name` 이라는 변수를 선언하였다. 다트에서는 `String` 외에도 `bool`, `int`, `double`, `num`, `rune`, `symbol` 과 같은 타입을 제공한다.

다트는 타입 추론이 가능한 언어다. 타입 추론을 사용하고자 할 경우에는 `var` 키워드를 사용하여 변수를 선언한다. `age` 의 경우 `var` 키워드를 사용하여 변수를 선언하였으며, `35` 라는 값을 통해 해당 변수의 타입이 `int` 임을 추론한다.

다트는 `dynamic` 과 `Object` 라는 타입도 제공하는데, 이러한 타입으로 변수를 선언하면 말 그대로 변수의 타입을 다양하게 변경할 수 있다.

아래 테스트 코드를 통해 이를 확인해 보도록 하자.

```dart
// variable_test.dart
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
```

첫 번째 테스트 코드에서는 `String` 과 `var` 을 사용한 변수의 타입을 확인하고 있다. `age` 의 경우에는 `35` 라는 값을 통해 `int` 타입이 추론되었음을 확인할 수 있다.

두 번째 테스트 코드에서는 `dynamic` 과 `Object` 를 사용한 변수의 타입을 확인하고 있다. 여기서 재미난 점은 `countryCode` 에 처음 대입한 값은 `82` 로 `int` 타입임을 확인 한 다음, `+82` 라는 `String` 타입을 다시 대입했다는 점이다. 그리고 타입을 다시 확인해보니 `countryCode` 의 타입이 `String` 으로 확인되었다. `pi` 역시 처음에는 `double` 로 확인이 되었지만 `3.141592...` 를 대입한 후에는 `String` 으로 타입이 변경 되었음을 확인할 수 있다. 이처럼 `dynamic` 이나 `Object` 를 사용하여 변수를 선언하면 변수를 한 가지 타입에만 국한시키지 않고 여러 타입으로 변경 할 수 있다.

다트는 숫자를 포함한 모든것을 객체로 표현된다. 따라서 초기값이 없는 변수는 `null` 로 초기화 된다.
