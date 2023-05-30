import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtesttest/model/shopping_item_model.dart';
import 'package:riverpodtesttest/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  // 보통 watch를 많이 씁니다.
  (ref) {
    // provider 여러개를 받네요..
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where((element) => filterState == FilterState.spicy
            ? element.isSpicy
            : !element.isSpicy)
        .toList();
  },
);

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
