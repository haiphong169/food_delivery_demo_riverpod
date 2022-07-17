import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cart extends StateNotifier<Map<String, int>> {
  Cart() : super(<String, int>{});

  int get length => state.length;

  void addItem(String id) {
    if (state.containsKey(id)) {
      state = {
        ...state,
        ...{id: state[id]! + 1}
      };
    } else {
      state = {
        ...state,
        ...{id: 1}
      };
    }
  }

  void removeItem(String id) {
    state = {
      for (var pair in state.entries)
        if (pair.key != id) ...{pair.key: pair.value}
    };
  }

  void substractItem(String id) {
    if (state[id] == 1) {
      removeItem(id);
    } else {
      state = {
        ...state,
        ...{id: state[id]! - 1}
      };
    }
  }

  void removeAll() {
    state = {};
  }
}
