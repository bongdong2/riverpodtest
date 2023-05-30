import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtesttest/layout/default_layout.dart';
import 'package:riverpodtesttest/model/shopping_item_model.dart';

import '../riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch하면 state가 바로 주입이 된다. super에 있는 배열 값
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);

    return DefaultLayout(
      title: 'StateNotifierProvider',
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
                title: Text(e.name),
                value: e.hasBought,
                onChanged: (value) {
                  // 단발성 실행은 ref.read
                  // notifier : 클래스가 바로 온다.
                  // toggleHasBought : 만든 메서드
                  ref.read(shoppingListProvider.notifier).toggleHasBought(name: e.name);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
