import 'package:template/store/slices/account/redusers.dart';
import 'package:template/store/slices/account/state.dart';
import 'package:template/store/slices/items/redusers.dart';

import 'slices/items/state.dart';

/*
  Store ----------------
 */
class AppState {
  final AccountState accountState;
  final ItemsState itemsState;

  AppState(this.accountState, this.itemsState);

  factory AppState.initialState() {
    return AppState(
      AccountState(),
      ItemsState(),
    );
  }
}

/*
  Redusers ----------------
 */
AppState appReducers(AppState state, action) {
  return AppState(
    accountReducers(state.accountState, action),
    itemsReducers(state.itemsState, action),
  );
}
