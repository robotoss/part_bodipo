// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static m0(value) => "Комментарии";

  static m1(value) => "Лайки";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "cancel" : MessageLookupByLibrary.simpleMessage("Отменить"),
    "comments" : m0,
    "createAnAccount" : MessageLookupByLibrary.simpleMessage("Создать аккаунт"),
    "error" : MessageLookupByLibrary.simpleMessage("Ошибка"),
    "errorEmptyField" : MessageLookupByLibrary.simpleMessage("Заполните поле"),
    "exit" : MessageLookupByLibrary.simpleMessage("Выйти"),
    "exitText" : MessageLookupByLibrary.simpleMessage("Вы уверены, что хотите выйти из приложения?"),
    "forgotPassword" : MessageLookupByLibrary.simpleMessage("Забыли пароль"),
    "likes" : m1,
    "login" : MessageLookupByLibrary.simpleMessage("Логин"),
    "logout" : MessageLookupByLibrary.simpleMessage("Выход"),
    "news" : MessageLookupByLibrary.simpleMessage("Новости"),
    "ok" : MessageLookupByLibrary.simpleMessage("Хорошо"),
    "password" : MessageLookupByLibrary.simpleMessage("Пароль"),
    "share" : MessageLookupByLibrary.simpleMessage("Поделиться"),
    "signIn" : MessageLookupByLibrary.simpleMessage("Авторизация"),
    "signInToContinue" : MessageLookupByLibrary.simpleMessage("Авторизируйтесь что бы продолжить"),
    "wellcome" : MessageLookupByLibrary.simpleMessage("Приветсвую!")
  };
}
