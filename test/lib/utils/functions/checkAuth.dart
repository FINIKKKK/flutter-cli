import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/extensions/store.dart';
import 'package:template/hooks/fetchData.dart';
import 'package:template/store/slices/account/actions.dart';

/*
  Проверка авторизации ----------------
 */
void checkAuth(BuildContext context, Function(bool) setLoading) async {
  final prefs = await SharedPreferences.getInstance();

  // Проверка аунтефикации пользователя
  final data = await fetchData('/account');

  // Проверка настроек приложения
  final lang = prefs.getString('lang');

  // Добавить настройки
  if (lang != null) {
    context.store.dispatch(
        ChangeLang(lang == 'ru' ? const Locale('ru') : const Locale('kk')));
  }

  if (lang == null) {
    String systemLanguage = Platform.localeName;

    systemLanguage == 'kk_KK'
        ? context.store.dispatch(ChangeLang(const Locale('kk')))
        : context.store.dispatch(ChangeLang(const Locale('ru')));
  }

  if (data != null) {
    // Соранить информацию о пользователе в хранилище
    context.store.dispatch(AddUserData(data));

    // Перенаправить пользователя
    Navigator.pushNamed(context, '/home');

    // Скрываем индикатор загрузки
    Future.delayed(const Duration(milliseconds: 200), () {
      setLoading(false);
    });
  } else {
    // Убрать загрузку
    setLoading(false);
  }
}
