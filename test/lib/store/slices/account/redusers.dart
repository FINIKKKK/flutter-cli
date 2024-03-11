import 'package:template/store/slices/account/actions.dart';
import 'package:template/store/slices/account/state.dart';

// -------------------------
// Reducers
// -------------------------
AccountState accountReducers(AccountState state, action) {
  switch (action.runtimeType) {
    case AddUserData:
      state.userData = action.value;
      return state;

    case RemoveUserData:
      state.userData = null;
      return state;

    case ChangeLang:
      state.lang = action.value;
      return state;

    default:
      return state;
  }
}
