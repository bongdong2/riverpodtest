import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtesttest/layout/default_layout.dart';
import 'package:riverpodtesttest/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');

    // 특정 조건에서만 화면을 렌더링 하고 싶을 때,
    // value는 상태
    // stete는 전체 모델이었는데 이제는 bool값이 되어버려
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    ref.listen(selectProvider.select((value) => value.hasBought), (previous, next) {
      print(next);
    });

    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.toString(),
            ),
            // Text(
            //   state.name.toString(),
            // ),
            // Text(
            //   state.isSpicy.toString(),
            // ),
            // Text(
            //   state.hasBought.toString(),
            // ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleIsSpicy();
              },
              child: Text(
                'Spicy Toggle',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasBought();
              },
              child: Text(
                'Bought Toggle',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
