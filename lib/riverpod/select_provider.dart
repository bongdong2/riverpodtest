import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtesttest/model/shopping_item_model.dart';

// StateNotifierProvider<{notifier타입}, {notifier에서 다루는 상태의 타입}>
final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
  (ref) => SelectNotifier(),


);

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
        );

  toggleHasBought() {
    state = state.copyWith(hasBought: !state.hasBought);
  }

  toggleIsSpicy() {
    state = state.copyWith(isSpicy: !state.isSpicy);
  }
}
