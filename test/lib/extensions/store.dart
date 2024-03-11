import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:template/store/store.dart';

/*
  Store Extension ----------------
 */
extension StoreExtension on BuildContext {
  Store<AppState> get store => StoreProvider.of<AppState>(this);
}
