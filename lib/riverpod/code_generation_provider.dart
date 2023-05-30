import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 Provider를 사용할 지 걱정할 고민 할 필요 없도록
// Provider, FutureProvider, StreamProvider(22년 12월 기준 안 됨)
// StateNotifierProvider

// 이 코드를 아래로 변경해서 코드 제너레이션 한다.
final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

// 대문자 Riverpod
// keepAlive true이면 캐싱하는 것
@Riverpod(keepAlive: true)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

// 2) Parameter > family 파라미터를 일반 함수처럼 사용할 수 있도록
class Parameter {
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, parameter) => parameter.number1 * parameter.number2,
);

// 위의 방식을 code generation
@riverpod
int gStateMultiply(
    GStateMultiplyRef ref, {
  required int number1,
  required int number2,
}) {
  return number1 * number2;
}

// 앞에 붙은 'G/g'는 꼭 붙여야 하는 게 아니다.
@riverpod
class GStateNotifier extends _$GStateNotifier {

  // build 메서드에 초기 값을 넣는다.
  @override
  int build() {
    return 0;
  }

  // state는 StateNotifier 내부의 state를 사용하는 것처럼 사용한다.
  increment() {
    state ++;
  }

  decrement() {
    state --;
  }
}

