// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(size) =>
      "File size too large: ${size} MB. The size should not exceed 1 MB.";

  static String m1(length) => "Cannot be more than ${length} characters long";

  static String m2(length) => "Must be at least ${length} characters long";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "_comment": MessageLookupByLibrary.simpleMessage(
            "==============================================="),
        "errors_auth_data":
            MessageLookupByLibrary.simpleMessage("Incorrect email or password"),
        "errors_auth_email": MessageLookupByLibrary.simpleMessage(
            "This email is already in use"),
        "errors_email":
            MessageLookupByLibrary.simpleMessage("Enter a valid email address"),
        "errors_image_required": MessageLookupByLibrary.simpleMessage(
            "You have not selected an image"),
        "errors_large_image": m0,
        "errors_max": m1,
        "errors_min": m2,
        "errors_required":
            MessageLookupByLibrary.simpleMessage("This field cannot be empty")
      };
}
