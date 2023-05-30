import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtesttest/layout/default_layout.dart';
import 'package:riverpodtesttest/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');

    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'state1 : $state1',
          ),
          state2.when(
            data: (data) {
              return Text(
                'state2 : $data',
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
          state3.when(
            data: (data) {
              return Text(
                'state3 : $data',
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
          Text('State 4 : $state4'),
          Consumer(
            builder: (context, ref, child) {
              print('builder build');
              final state5 = ref.watch(gStateNotifierProvider);
              return Row(
                children: [
                  Text('State 5 : $state5'),
                  if(child != null)
                    child
                ],
              );
            },
            child: Text('hello'), // 여기에 있는 위젯이 위의 child가 되어 렌더링 된다.
            // 퍼포먼스상 한 번만 빌드 되어야 하는 위젯을 여기에 넣는다.
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: Text('Decrement'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // 2.0부터 생김
              ref.invalidate(gStateNotifierProvider);
            },
            child: Text('Invalidate'),
          ),
        ],
      ),
    );
  }
}
