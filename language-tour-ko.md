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


## Keywords

아래는 다트 언어에서 특별하게 취급하는 단어를 표로 나타냈다.

{% assign ckw = '&nbsp;<sup title="contextual keyword" alt="contextual keyword">1</sup>' %}
{% assign bii = '&nbsp;<sup title="built-in-identifier" alt="built-in-identifier">2</sup>' %}
{% assign lrw = '&nbsp;<sup title="limited reserved word" alt="limited reserved word">3</sup>' %}
| [abstract][]{{bii}}   | [dynamic][]{{bii}}    | [implements][]{{bii}} | [show][]{{ckw}}   |
| [as][]{{bii}}         | [else][]              | [import][]{{bii}}     | [static][]{{bii}} |
| [assert][]            | [enum][]              | [in][]                | [super][]         |
| [async][]{{ckw}}      | [export][]{{bii}}     | [interface][]{{bii}}  | [switch][]        |
| [await][]{{lrw}}      | [extends][]           | [is][]                | [sync][]{{ckw}}   |
| [break][]             | [external][]{{bii}}   | [library][]{{bii}}    | [this][]          |
| [case][]              | [factory][]{{bii}}    | [mixin][]{{bii}}      | [throw][]         |
| [catch][]             | [false][]             | [new][]               | [true][]          |
| [class][]             | [final][]             | [null][]              | [try][]           |
| [const][]             | [finally][]           | [on][]{{ckw}}         | [typedef][]{{bii}}|
| [continue][]          | [for][]               | [operator][]{{bii}}   | [var][]           |
| [covariant][]{{bii}}  | [Function][]{{bii}}   | [part][]{{bii}}       | [void][]          |
| [default][]           | [get][]{{bii}}        | [rethrow][]           | [while][]         |
| [deferred][]{{bii}}   | [hide][]{{ckw}}       | [return][]            | [with][]          |
| [do][]                | [if][]                | [set][]{{bii}}        | [yield][]{{lrw}}  |
{:.table .table-striped .nowrap}

[abstract]: #abstract-classes
[as]: #type-test-operators
[assert]: #assert
[async]: #asynchrony-support
[await]: #asynchrony-support
[break]: #break-and-continue
[case]: #switch-and-case
[catch]: #catch
[class]: #instance-variables
[const]: #final-and-const
{% comment %}
  [TODO: Make sure that points to a place that talks about const constructors,
  as well as const literals and variables.]
{% endcomment %}
[continue]: #break-and-continue
[covariant]: /guides/language/sound-problems#the-covariant-keyword
[default]: #switch-and-case
[deferred]: #lazily-loading-a-library
[do]: #while-and-do-while
[dynamic]: #important-concepts
[else]: #if-and-else
[enum]: #enumerated-types
[export]: /guides/libraries/create-library-packages
[extends]: #extending-a-class
[external]: https://stackoverflow.com/questions/24929659/what-does-external-mean-in-dart
[factory]: #factory-constructors
[false]: #booleans
[final]: #final-and-const
[finally]: #finally
[for]: #for-loops
[Function]: #functions
[get]: #getters-and-setters
[hide]: #importing-only-part-of-a-library
[if]: #if-and-else
[implements]: #implicit-interfaces
[import]: #using-libraries
[in]: #for-loops
[interface]: https://stackoverflow.com/questions/28595501/was-the-interface-keyword-removed-from-dart
[is]: #type-test-operators
[library]: #libraries-and-visibility
[mixin]: #adding-features-to-a-class-mixins
[new]: #using-constructors
[null]: #default-value
[on]: #catch
[operator]: #overridable-operators
[part]: /guides/libraries/create-library-packages#organizing-a-library-package
[rethrow]: #catch
[return]: #functions
[set]: #getters-and-setters
[show]: #importing-only-part-of-a-library
[static]: #class-variables-and-methods
[super]: #extending-a-class
[switch]: #switch-and-case
[sync]: #generators
[this]: #constructors
[throw]: #throw
[true]: #booleans
[try]: #catch
[typedef]: #typedefs
[var]: #variables
[void]: https://medium.com/dartlang/dart-2-legacy-of-the-void-e7afb5f44df0
{% comment %}
  TODO: Add coverage of void to the language tour.
{% endcomment %}
[with]: #adding-features-to-a-class-mixins
[while]: #while-and-do-while
[yield]: #generators

이러한 단어를 식별자로 사용하는 것은 피하도록 한다. 그러나, 첨자가 표시된 키워드는 필요에 따라 식별자로 사용할 수 있다.

* 첨자 **1**이 표시된 단어는 **contextual keywords**로, 특정 위치에서만 의미를 갖는다. 이들 키워드는 어느곳에서나 유효한 식별자가 된다.

* 첨자 **2**가 표시된 단어는 **built-in identifiers**다. 이는 자바스크립트 코드를 다트로 포팅하는 작업을 단순화 하기 위함으로, 이러한 키워드는 대부분에서 유효한 식별자가 되지만, 클래스나 타입명 또는 임포트의 접두사로는 사용할 수 없다.

* 첨자 **3**이 표시된 단어는 다트 1.0 릴리즈 이후 추가된 [asynchrony support](#asynchrony-support)와 관련이 있는 새로 도입된 제한된 예약어다. `async`, `async*`, 또는 `sync*`로 표시된 함수에는 `await` 나 `yield`를 식별자로 사용할 수 없다.

표에 있는 나머지 모든 단어는 **예약어**로, 이러한 단어는 식별자가 될 수 없다.


## Variables

다음은 변수를 생성하고 초기화 하는 예제이다.

<?code-excerpt "misc/lib/language_tour/variables.dart (var-decl)"?>
{% prettify dart %}
var name = 'Bob';
{% endprettify %}

변수는 참조를 저장한다. `name` 이라는 이름의 변수는 "Bob" 이라는 값을 가진 `String` 객체의 참조를 포함한다.

`name` 변수의 타입은 `String` 으로 추론 되지만, 타입을 명시하면 이를 변경할 수 있다. 객체를 단일 타입으로 한정짓고 싶지 않다면, 타입을 `Object` 나 `dynamic` 으로 명시하며, 이와 관련된 내용은 [design guidelines][ObjectVsDynamic] 을 참고하도록 한다.

{% comment %}
**[PENDING: check on Object vs. dynamic guidance.]**
{% endcomment %}

<?code-excerpt "misc/lib/language_tour/variables.dart (type-decl)"?>
{% prettify dart %}
dynamic name = 'Bob';
{% endprettify %}

또 다른 선택지로는 참조될 타입을 명시적으로 선언하는 방법이 있다.

<?code-excerpt "misc/lib/language_tour/variables.dart (static-types)"?>
{% prettify dart %}
String name = 'Bob';
{% endprettify %}

<div class="alert alert-info" markdown="1">
**Note:**
이 페이지에서는 로컬 변수를 선언함에 있어 타입 어노테이션보다는 `var` 를 사용함으로써 [style guide recommendation](/guides/language/effective-dart/design#types)의 내용을 따른다.
</div>


### Default value

초기화 되지않은 변수는 초깃값으로 `null`을 갖는다. 심지어 숫자 타입의 변수 역시 초기에는 null을 갖는데, 이는 숫자를 포함한 다트의 모든 값은 객체이기 때문이다.

<?code-excerpt "misc/test/language_tour/variables_test.dart (var-null-init)"?>
{% prettify dart %}
int lineCount;
assert(lineCount == null);
{% endprettify %}

<div class="alert alert-info" markdown="1">
**Note:**
출시되는 코드에서는 `assert()` 호출이 무시된다. 개발 버전에서 <code>assert(<em>condition</em>)</code> 코드는 *‌조건*이 참이 아닌 경우 예외를 발생시킨다. 자세한 사항은 [Assert](#assert)을 참고하도록 한다.
</div>


### Final and const

변수를 변경할 의도가 전혀 없다면 `var` 나 그 외 타입을 사용하는 대신, `final` 이나 `const` 를 사용하도록 하자. final 변수는 오직 한번만 값을 설정할 수 있다. const 변수는 컴파일 타임 상수이다(const 변수는 암묵적으로 final 이 된다.). 최 상위 래벨 final 변수나 final 클래스 변수는 해당 변수를 처음 사용할 때 초기화된다.

<div class="alert alert-info" markdown="1">
**Note:**
Instance variables can be `final` but not `const`.
Final instance variables must be initialized before
the constructor body starts —
at the variable declaration, by a constructor parameter,
or in the constructor's [initializer list](#initializer-list).
</div>

다음은 final 변수 생성과 설정에 관한 예제다.

<?code-excerpt "misc/lib/language_tour/variables.dart (final)"?>
{% prettify dart %}
final name = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';
{% endprettify %}

final 변수는 값을 변경할 수 없다.

{:.fails-sa}
<?code-excerpt "misc/lib/language_tour/variables.dart (cant-assign-to-final)"?>
{% prettify dart %}
name = 'Alice'; // Error: a final variable can only be set once.
{% endprettify %}

변수가 **컴파일 타임 상수**로 되길 바란다면 `const`를 사용하자. const 변수가 클래스 래벨에 선언되어 있다면, 변수를 `static const`로 선언하도록 한다. 변수를 선언할 때에는 숫자나 문자열 리터럴과 같은 컴파일 타임 상수나 const 변수 또는 상수 숫자에 대한 산술 연산의 결과를 값으로 설정한다.

<?code-excerpt "misc/lib/language_tour/variables.dart (const)"?>
{% prettify dart %}
const bar = 1000000; // Unit of pressure (dynes/cm2)
const double atm = 1.01325 * bar; // Standard atmosphere
{% endprettify %}

`const` 키위드는 단지 const 변수를 선언하기 위함만은 아니다. 상수 _값_ 을 생성하는 것은 물론 상수 값을 _생성_ 하는 생성자를 선언하는 데에도 `const` 키워드를 사용할 수 있다.

<?code-excerpt "misc/lib/language_tour/variables.dart (const-vs-final)"?>
{% prettify dart %}
var foo = const [];
final bar = const [];
const baz = []; // Equivalent to `const []`
{% endprettify %}

위에서 살펴본 `baz` 처럼 `const` 을 선언하는 초기화 표현식에서는 `const` 를 생략할 수 있다. 자세한 내용은 [DON’T use const redundantly][] 을 살펴보도록 한다.

const 값을 가지고 있다고 하더라도 final 이나 const 변수가 아닌 값은 값을 변경할 수 있다.

<?code-excerpt "misc/lib/language_tour/variables.dart (reassign-to-non-final)"?>
{% prettify dart %}
foo = [1, 2, 3]; // Was const []
{% endprettify %}

const 변수의 값은 변경할 수 없다.

{:.fails-sa}
<?code-excerpt "misc/lib/language_tour/variables.dart (cant-assign-to-const)"?>
{% prettify dart %}
baz = [42]; // Error: Constant variables can't be assigned a value.
{% endprettify %}

상수 값을 생성하기 위해 `const` 를 사용하는데 있어 더 자세한 정보를 얻고자 한다면 [Lists](#lists), [Maps](#maps), and [Classes](#classes) 를 살펴보도록 하자.


## Built-in types

다트 언어는 다음 타입은 특별하게 취급한다.

- numbers
- strings
- booleans
- lists (*배열*로도 알려져있다)
- maps
- runes (문자열에서 유니코드 문자를 나타내기 위함)
- symbols

이러한 특별한 타입의 객체는 리터럴을 사용하여 초기화 할 수 있다. 예를 들어, `'this is a string'` 은 문자열 리터럴이며 `true` 는 불리언 리터럴이다.

{% comment %}
PENDING: add info about support for Iterable, Future, Stream?
Those can't be initialized using literals, but they do have special support.
{% endcomment %}

다트의 모든 변수는 *클래스*의 인스턴스인 객체를 참조하고 있기 때문에, 보통은 *생성자* 를 사용하여 변수를 초기화 한다. 일부 내장 타입은 자신만의 생성자를 갖는다. 예를 들어, 맵을 생성할 때에는 `Map()` 생성자를 사용한다.

### Numbers

다트 숫자에는 두 종류가 있다.

[int][]

:   플랫폼에 따라 정수 값은 64 비트 보다 클 수 없다. 다트 VM에서는 -2<sup>63</sup> to 2<sup>63</sup> - 1 의 값을 가질 수 있다. 자바스크립트로 컴파일된 다트의 경우에는 [자바스크립트 number][js numbers]를 사용하며, -2<sup>53</sup> to 2<sup>53</sup> - 1 의 값을 허용한다.

{% comment %}
[PENDING: What about values on Android & iOS?
The informal spec is at
https://github.com/dart-lang/sdk/blob/master/docs/language/informal/int64.md.
{% endcomment %}

[double][]

:   IEEE 754 표준에 명시된 64-비트 (배정밀도) 부동 소수점 숫자다.

`int` 와 `double` 모두 [`num`][num]의 서브타입이다. num 타입은 +, -, /, \* 와 같은 기본 연산자를 포함하며, 다른 메소드로는 `abs()`,` ceil()`, `floor()` 에서 발견할 수 있을 것이다. (\>\> 와 같은 비트 연산자는 `int` 클래스에 정의되어 있다.) num 과 num 의 서브타입에는 여러분이 찾고자 하는것이 없으며, [dart:math][] 에 아마 찾고자 하는 것들이 있을 것이다.

정수에는 소수점이 없다. 다음은 정수 리터럴을 정의하는 몇 가지 예제다.

<?code-excerpt "misc/lib/language_tour/built_in_types.dart (integer-literals)"?>
{% prettify dart %}
var x = 1;
var hex = 0xDEADBEEF;
{% endprettify %}

숫자가 소수점을 포함한다면 이는 double이 된다. 다음은 실수 리터럴을 정의하는 몇 가지 예제다.

<?code-excerpt "misc/lib/language_tour/built_in_types.dart (double-literals)"?>
{% prettify dart %}
var y = 1.1;
var exponents = 1.42e5;
{% endprettify %}

다트 2.1 부터, 정수 리터럴은 필요에 따라 실수로 자동 변환된다.

<?code-excerpt "misc/lib/language_tour/built_in_types.dart (int-to-double)"?>
{% prettify dart %}
double z = 1; // Equivalent to double z = 1.0.
{% endprettify %}

<aside class="alert alert-info" markdown="1">
  **Version note:**
  Before Dart 2.1, it was an error to use an integer literal
  in a double context.
</aside>

다음은 문자열을 숫자로 변환하거나 그 반대로 변환하는 방법을 보여준다.

<?code-excerpt "misc/test/language_tour/built_in_types_test.dart (number-conversion)"?>
{% prettify dart %}
// String -> int
var one = int.parse('1');
assert(one == 1);

// String -> double
var onePointOne = double.parse('1.1');
assert(onePointOne == 1.1);

// int -> String
String oneAsString = 1.toString();
assert(oneAsString == '1');

// double -> String
String piAsString = 3.14159.toStringAsFixed(2);
assert(piAsString == '3.14');
{% endprettify %}

int 타입은 전통적인 비트 쉬프트 (\<\<, \>\>)와 AND(&), 그리고 OR (|) 연산자를 명세하고 있다. 예를 들어,

<?code-excerpt "misc/test/language_tour/built_in_types_test.dart (bit-shifting)"?>
{% prettify dart %}
assert((3 << 1) == 6); // 0011 << 1 == 0110
assert((3 >> 1) == 1); // 0011 >> 1 == 0001
assert((3 | 4) == 7); // 0011 | 0100 == 0111
{% endprettify %}

숫자 리터럴은 컴파일 타임 상수이다. 피연산자 숫자로 취급되는 컴파일 타임 상수인 한, 많은 산술 표현식 역시 컴파일 타임 상수가 된다.

<?code-excerpt "misc/lib/language_tour/built_in_types.dart (const-num)"?>
{% prettify dart %}
const msPerSecond = 1000;
const secondsUntilRetry = 5;
const msUntilRetry = secondsUntilRetry * msPerSecond;
{% endprettify %}


### Strings

다트 문자열은 UTF-16 코드 유닛의 시퀀스다. 작은 따옴표나 큰 따옴표를 사용하여 문자열을 생성할 수 있다.

<?code-excerpt "misc/lib/language_tour/built_in_types.dart (quoting)"?>
{% prettify dart %}
var s1 = 'Single quotes work well for string literals.';
var s2 = "Double quotes work just as well.";
var s3 = 'It\'s easy to escape the string delimiter.';
var s4 = "It's even easier to use the other delimiter.";
{% endprettify %}

`${`*`expression`*`}` 을 사용하면 문자열 내부에 표현식의 값을 추가할 수 있다. 표현식이 식별자라면, {} 를 생략할 수도 있다. 객체에 상응하는 문자열을 얻기 위해, 다트에서는 객체의 `toString()` 메소드를 호출한다.

<?code-excerpt "misc/test/language_tour/built_in_types_test.dart (string-interpolation)"?>
{% prettify dart %}
var s = 'string interpolation';

assert('Dart has $s, which is very handy.' ==
    'Dart has string interpolation, ' +
        'which is very handy.');
assert('That deserves all caps. ' +
        '${s.toUpperCase()} is very handy!' ==
    'That deserves all caps. ' +
        'STRING INTERPOLATION is very handy!');
{% endprettify %}

<div class="alert alert-info" markdown="1">
**Note:**
The `==` operator tests whether two objects are equivalent. Two
strings are equivalent if they contain the same sequence of code
units.
</div>

근접한 문자열 리터럴 또는 `+` 연산자를 사용하여 문자열을 결합 할 수도 있다.

<?code-excerpt "misc/test/language_tour/built_in_types_test.dart (adjacent-string-literals)"?>
{% prettify dart %}
var s1 = 'String '
    'concatenation'
    " works even over line breaks.";
assert(s1 ==
    'String concatenation works even over '
    'line breaks.');

var s2 = 'The + operator ' + 'works, as well.';
assert(s2 == 'The + operator works, as well.');
{% endprettify %}

여러 줄의 문자열을 생성하기 위한 또 다른 방법으로, 작은 따옴표 또는 큰 따옴표를 삼중으로 사용하는 방법이 있다.

<?code-excerpt "misc/lib/language_tour/built_in_types.dart (triple-quotes)"?>
{% prettify dart %}
var s1 = '''
You can create
multi-line strings like this one.
''';

var s2 = """This is also a
multi-line string.""";
{% endprettify %}

접두어로 `r` 을 추가하면 "raw" 문자열을 생성할 수 있다.

<?code-excerpt "misc/lib/language_tour/built_in_types.dart (raw-strings)"?>
{% prettify dart %}
var s = r'In a raw string, not even \n gets special treatment.';
{% endprettify %}

문자열에서 유니코드 문자를 표현하는 방법을 자세히 알고 싶다면 [Runes](#runes) 를 살펴보도록 하자.

덧붙힌 표현식이 null 또는 숫자, 문자열 혹은 불리언 값으로 평가되는 컴파일 타임 상수인 한, 문자열 리터럴은 컴파일 타임 상수가 된다.

<?code-excerpt "misc/lib/language_tour/built_in_types.dart (string-literals)"?>
{% prettify dart %}
// These work in a const string.
const aConstNum = 0;
const aConstBool = true;
const aConstString = 'a constant string';

// These do NOT work in a const string.
var aNum = 0;
var aBool = true;
var aString = 'a string';
const aConstList = [1, 2, 3];

const validConstString = '$aConstNum $aConstBool $aConstString';
// const invalidConstString = '$aNum $aBool $aString $aConstList';
{% endprettify %}

문자열을 사용함에 있어 더 많은 정보를 보고자 한다면, [Strings and regular expressions](/guides/libraries/library-tour#strings-and-regular-expressions)을 살펴보길 바란다.


### Booleans

다트에서는 불리언 값을 나타내기 위해 `bool` 이라는 타입이 존재한다. 오직 두 객체만이 불 타입을 갖는다. 불리언 리터럴은 `true` 와 `false` 이며 두 리터럴 모두 컴파일 타임 상수이다.

다트는 타입 안정성을 지원하는 언어이며, 이는 <code>if (<em>nonbooleanValue</em>)</code> or
<code>assert (<em>nonbooleanValue</em>)</code> 와 같은 코드를 사용할 수 없다는 것을 의미한다. 대신, 다음과 같이 명시적으로 값을 체크한다.

<?code-excerpt "misc/test/language_tour/built_in_types_test.dart (no-truthy)"?>
{% prettify dart %}
// Check for an empty string.
var fullName = '';
assert(fullName.isEmpty);

// Check for zero.
var hitPoints = 0;
assert(hitPoints <= 0);

// Check for null.
var unicorn;
assert(unicorn == null);

// Check for NaN.
var iMeantToDoThis = 0 / 0;
assert(iMeantToDoThis.isNaN);
{% endprettify %}