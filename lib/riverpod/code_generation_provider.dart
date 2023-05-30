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
@Riverpod(
  keepAlive: true
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

// 2) Parameter > family 파라미터를 일반 함수처럼 사용할 수 있도록


