import 'package:flutter/material.dart';

// -------------------------
// State
// -------------------------
class AccountState {
  dynamic userData;
  Locale lang;

  AccountState({
    this.userData,
    this.lang = const Locale('ru'),
  });
}
