// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(size) =>
      "Размер файла слишком большой: ${size} МБ. Размер должен быть не более 1 МБ.";

  static String m1(length) => "Не может быть более ${length} символов";

  static String m2(length) => "Должно быть не менее ${length} символов";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "_comment": MessageLookupByLibrary.simpleMessage(
            "==============================================="),
        "errors_auth_data":
            MessageLookupByLibrary.simpleMessage("Неверная почта или пароль"),
        "errors_auth_email": MessageLookupByLibrary.simpleMessage(
            "Данная почта уже используется"),
        "errors_email": MessageLookupByLibrary.simpleMessage(
            "Введите действительный адрес электронной почты"),
        "errors_image_required":
            MessageLookupByLibrary.simpleMessage("Вы не выбрали изображение"),
        "errors_large_image": m0,
        "errors_max": m1,
        "errors_min": m2,
        "errors_required": MessageLookupByLibrary.simpleMessage(
            "Это поле не может быть пустым")
      };
}
