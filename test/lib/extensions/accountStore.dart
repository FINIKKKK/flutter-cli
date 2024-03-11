import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:template/store/slices/account/state.dart';
import 'package:template/store/store.dart';

/*
  AppStore Extension ----------------
 */
extension AppStoreExtension on BuildContext {
  AccountState get accountStore =>
      StoreProvider.of<AppState>(this).state.accountState;

  Locale get lang => accountStore.lang;

  bool get isLangRU => accountStore.lang == const Locale('ru');

  bool get isLangEN => accountStore.lang == const Locale('en');
}
