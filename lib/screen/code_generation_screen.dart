import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtesttest/layout/default_layout.dart';
import 'package:riverpodtesttest/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));
    final state5 = ref.watch(gStateNotifierProvider);

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
          Text('State 5 : $state5'),
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
          )
        ],
      ),
    );
  }
}
