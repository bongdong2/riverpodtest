import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  // provider가 업데이트 되면 호출되는 메서드
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    //super.didUpdateProvider(provider, previousValue, newValue, container);
    print('[Provider Updated] provider : $provider / pv : $previousValue / nv : $newValue');
  }

  // provider 추가되면 호출되는 메서드
  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    //super.didAddProvider(provider, value, container);
    print('[Provider Added] provider : $provider / value : $value');
  }

  // provider 삭제됐을 떄 호출되는 메서드
  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    //super.didDisposeProvider(provider, containers);
    print('[Provider Disposed] provider : $provider');
  }
}