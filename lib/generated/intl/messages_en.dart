// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(value) => "${value} Comments";

  static m1(value) => "${value} Likes";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "comments" : m0,
    "createAnAccount" : MessageLookupByLibrary.simpleMessage("Create an account"),
    "error" : MessageLookupByLibrary.simpleMessage("Error"),
    "errorEmptyField" : MessageLookupByLibrary.simpleMessage("Fill in the field"),
    "exit" : MessageLookupByLibrary.simpleMessage("Exit"),
    "exitText" : MessageLookupByLibrary.simpleMessage("Are you sure you want to exit the application?"),
    "forgotPassword" : MessageLookupByLibrary.simpleMessage("Forgot password"),
    "likes" : m1,
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "logout" : MessageLookupByLibrary.simpleMessage("Logout"),
    "news" : MessageLookupByLibrary.simpleMessage("News"),
    "ok" : MessageLookupByLibrary.simpleMessage("Ok"),
    "password" : MessageLookupByLibrary.simpleMessage("Password"),
    "share" : MessageLookupByLibrary.simpleMessage("Share"),
    "signIn" : MessageLookupByLibrary.simpleMessage("Sign in"),
    "signInToContinue" : MessageLookupByLibrary.simpleMessage("Sign in to continue"),
    "wellcome" : MessageLookupByLibrary.simpleMessage("Wellcome!")
  };
}
