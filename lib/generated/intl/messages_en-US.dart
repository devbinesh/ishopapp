// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("Essentia"),
        "btn_add_to_cart": MessageLookupByLibrary.simpleMessage("Add to Bag"),
        "delivery_no_available_msg": MessageLookupByLibrary.simpleMessage(
            "Sorry, currently we are not delivering to this location"),
        "home_search_placeholder":
            MessageLookupByLibrary.simpleMessage("Search"),
        "home_store_category_heading":
            MessageLookupByLibrary.simpleMessage("Essentials deliver to you"),
        "nav_btn_account_txt": MessageLookupByLibrary.simpleMessage("Account"),
        "nav_btn_bag_text": MessageLookupByLibrary.simpleMessage("Cart"),
        "nav_btn_home_text": MessageLookupByLibrary.simpleMessage("Home")
      };
}
