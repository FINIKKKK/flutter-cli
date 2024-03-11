import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:template/store/slices/items/state.dart';
import 'package:template/store/store.dart';

/*
  ItemsStore Extension ----------------
 */
extension ItemsStoreExtension on BuildContext {
  ItemsState get itemsStore =>
      StoreProvider.of<AppState>(this).state.itemsState;
}
