import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtesttest/layout/default_layout.dart';
import 'package:riverpodtesttest/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // read, listen, watch 만 쓸거야
    // watch : 특정 provider를 바라보다가 변경하면 build를 실행
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                // read : 유저의 액션을 받아서 그것을 변화를 프로세스한다.
                // notifier : 값을 바꾸고 싶을 떄
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: Text('UP'),
            ),
            ElevatedButton(
              // update 대신에 state 사용
              onPressed: () {
                ref.read(numberProvider.notifier).state =
                  ref.read(numberProvider.notifier).state -1;
              },
              child: Text('DOWN'),
            ),
            ElevatedButton(
              onPressed: () {
                //ref.read(numberProvider.notifier).update((state) => state + 1);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => _NextScreen(),),
                );
              },
              child: Text('NEXT SCREEN'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 똑같은 provider를 watch하고 있다면 화면이 전환되어도 값을 공유할 수 있다.
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: Text('UP'),
            ),
          ],
        ),
      ),
    );
  }
}

