---
title: A Tour of the Dart Language
description: A tour of all of the major Dart language features.
short-title: Language Tour
---
<?code-excerpt replace="/([A-Z]\w*)\d\b/$1/g"?>

이 문서에서는 여러분이 이미 다른 언어에서 프로그래밍을 알고 있다는 가정하에, 변수와 연산자에서 클래스와 라이브러리에 이르기까지 다트의 주요 기능을 사용하는 방법을 보여준다.

다트 코어 라이브러리에 대해 더 알고 싶은 경우에는, [A Tour of the Dart Libraries](/guides/libraries/library-tour)를 살펴보길 바란다. 언어의 기능에 대해 자세히 알고 싶은 경우에는 [Dart Language Specification](/guides/language/spec)를 참고하도로고 한다.

<div class="alert alert-info" markdown="1">
**Tip:**
DartPad 를 사용하면 다트 언어 기능의 대부분을 실행해 볼 수 있다([더보기](/tools/dartpad)).

**<a href="{{ site.custom.dartpad.direct-link }}" target="_blank">Open DartPad</a>**
</div>


## A basic Dart program

아래 코드에서는 여러가지 다트의 가장 기본 기능을 사용한다.

<?code-excerpt "misc/test/language_tour/basic_test.dart"?>
{% prettify dart %}
// Define a function.
printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
main() {
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
}
{% endprettify %}

다음은 이 프로그램에서 사용하는 코드이며 이는 모든(또는 대부분의) 다트 앱에도 적용된다.

<code>// <em>This is a comment.</em> </code>

:   한 줄 주석이다. 다트는 여러 줄 주석과 문서용 주석도 지원한다. 자세한 사항은 [Comments](#comments)를 살펴보도록 한다.

`int`

:   타입이다. 다른 [built-in types](#built-in-types)으로는 `String`, `List`, and `bool`이 있다.

`42`

:   숫자 리터럴이다. 숫자 리터럴은 컴파일 타임 상수의 일종이다.

`print()`

:   결과물을 출력하는 편리한 방법이다.

`'...'` (or `"..."`)

:   문자열 리터럴이다.

<code>$<em>variableName</em></code> (or <code>${<em>expression</em>}</code>)

:   문자열 보간법(interpolation): 문자열 리터럴 내부에 변수나 표현식 문자열을 포함한다. 더 자세한 사항은 [Strings](#strings)를 살펴보도록 한다.

`main()`

:   특별하면서도 반드시 필요한 최 상위 함수(top-level function)로, 앱 실행이 시작되는 지점이다. 자세한 사항은 [The main() function](#the-main-function)을 살펴보도록 한다.

`var`

:   타입을 명시하지 않으면서 변수를 선언하는 방법이다.

<div class="alert alert-info" markdown="1">
**Note:**
이 사이트는 [Dart style guide](/guides/language/effective-dart/style)에 있는 컨벤션을 따른다.
</div>


## Important concepts

다트 언어를 배우는 경우, 다음의 사항과 개념을 명심하도록 한다.

-   변수에 할당할 수 있는 모든것은 *객체*이며, 모든 객체는 *클래스*의 인스턴스다. 심지어 숫자 (number)와 함수 그리고 `null` 도 객체다. 모든 객체는 (Object)[] 클래스를 상속한다.

-   다트는 강타입 언어지만, 타입 추론을 할 수 있기 때문에 타입 어노테이션은 선택사항이다. 위 코드에서 `숫자`는 `int` 타입으로 추론되었다. 타입이 없다는 것을 명시적으로 나타내고 싶은 경우에는 [`dynamic`](ObjectVsDynamic) 이라는 특수한 타입을 사용한다.

-   다트는 `List<int>`(정수형 리스트) 또는 `List<dynamic>`(모든 타입의 객체를 담는 리스트) 처럼 제네릭 타입을 지원한다.

-   다트는 최상위 레벨의 함수(top-level function)(`main()` 과 같은)를 지원할 뿐만 아니라, 클래스나 객체에 의존하는 함수도 지원한다.(*정적* 메소드* 와 인스턴스 메소드*를 각각 지원) 또한 함수 내에 함수를 생성할 수도 있다.(*중첩 함수* 또는 *지역 함수*)

-   위와 유사하게, 다트는 최상위 레벨 *변수*(top-level variable)을 지원할 뿐만 아니라, 클래스나 객체에 의존하는 변수도 지원한다.(정적 변수와 인스턴스 변수) 인스턴스 변수는 필드 또는 프로퍼티로 부른다.

-   다트는 자바와는 달리 `public`이나 `protected` 또는 `private`와 같은 키워드를 갖지 않는다. 식별자가 밑줄(\_)로 시작하는 경우, 해당 식별자는 라이브러리에서 private 으로 동작한다. 자세한 사항은 [Libraries and visibility](#libraries-and-visibility)를 참고하도록 한다.

-   *식별자*는 문자나 밑줄(\_)로 시작할 수 있으며, 그 뒤로 문자와 숫자의 조합이 따라온다.

-   다트는 *표현식*(런타임 값을 갖는)과 *명령문*(값을 갖지 않는)을 모두 지원한다. 예를 들어, [조건 표현식](#conditional-expressions)인 `condition ? expr1 : expr2`는 `expr1` 또는 `expr2` 중 하나의 값을 갖는다. 값을 갖지 않는 [if-else 문](#if-and-else)과 비교해 보도록 하자. 명령문은 종종 하나 이상의 표현식을 포함하는 반면, 표현식은 명령문을 직접적으로 포함할 수 없다.

-   다트 도구는 _warnings_ and _errors_ 이렇게 두 종류의 문제를 보고할 수 있다. 경고는 단지 코드가 정상적으로 동작하지 않을 수 있다는 것을 나타내며, 프로그램이 실행되는것을 막지는 않는다. 에러는 컴파일 에러나 런타임 에러가 될 수 있다. 컴파일 타임 에러는 코드가 실행되는 것을 막는다. 런타임 에러는 코드가 실행되는 동안 [예외](#exceptions)을 발생시킨다.
