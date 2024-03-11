import 'package:flutter/material.dart';
import 'package:template/generated/l10n.dart';

/*
  Хук для валидации значений ----------------
 */
class Validator {
  // Схема для проверки значения
  static String? required(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).errors_required;
    }
    return null;
  }

  // Схема для проверки значения не меньше заданного
  static String? min(BuildContext context, String? value, int length) {
    if (value == null || value.isEmpty) {
      return S.of(context).errors_required;
    } else if (value.length < length) {
      return S.of(context).errors_min(length);
    }
    return null;
  }

  // Схема для проверки значения не больше заданного
  static String? max(BuildContext context, String? value, int length) {
    if (value != null && value.length > length) {
      return S.of(context).errors_max(length);
    }
    return null;
  }

  // Схема для проверки значения на валидность email
  static String? email(BuildContext context, String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (value == null || !regex.hasMatch(value)) {
      return S.of(context).errors_email;
    }
    return null;
  }

  // Функция комбинирования разных схем
  static FormFieldValidator<String> validate(BuildContext context,
      List<String? Function(BuildContext, String?)> validators) {
    return (String? value) {
      for (var validator in validators) {
        var result = validator(context, value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }
}
