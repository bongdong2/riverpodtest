import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodtesttest/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '라면',
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '삼겹살',
              quantity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '수박',
              quantity: 2,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '카스테라',
              quantity: 5,
              hasBought: false,
              isSpicy: false,
            ),
          ], // super 안에 들어가는 건 ShoppingListProvider 상태를 초기화 하는 값, 값이 없어도 된다.
        );

  // 이름이 같으면 hasBought를 토클해주는 메소드
  void toggleHasBought({required String name}) {
    // state : 이 변수는 StateNotifier 에서 자동으로 제공되는 값이다. 그리고 super에 들어가는 값으로 초기화 된다.
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  }
}
