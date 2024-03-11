// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `===============================================`
  String get _comment {
    return Intl.message(
      '===============================================',
      name: '_comment',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password`
  String get errors_auth_data {
    return Intl.message(
      'Incorrect email or password',
      name: 'errors_auth_data',
      desc: '',
      args: [],
    );
  }

  /// `This email is already in use`
  String get errors_auth_email {
    return Intl.message(
      'This email is already in use',
      name: 'errors_auth_email',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty`
  String get errors_required {
    return Intl.message(
      'This field cannot be empty',
      name: 'errors_required',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get errors_email {
    return Intl.message(
      'Enter a valid email address',
      name: 'errors_email',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least {length} characters long`
  String errors_min(Object length) {
    return Intl.message(
      'Must be at least $length characters long',
      name: 'errors_min',
      desc: '',
      args: [length],
    );
  }

  /// `Cannot be more than {length} characters long`
  String errors_max(Object length) {
    return Intl.message(
      'Cannot be more than $length characters long',
      name: 'errors_max',
      desc: '',
      args: [length],
    );
  }

  /// `You have not selected an image`
  String get errors_image_required {
    return Intl.message(
      'You have not selected an image',
      name: 'errors_image_required',
      desc: '',
      args: [],
    );
  }

  /// `File size too large: {size} MB. The size should not exceed 1 MB.`
  String errors_large_image(Object size) {
    return Intl.message(
      'File size too large: $size MB. The size should not exceed 1 MB.',
      name: 'errors_large_image',
      desc: '',
      args: [size],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
