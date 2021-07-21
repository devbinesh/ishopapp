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

  /// `Essentia`
  String get app_name {
    return Intl.message(
      'Essentia',
      name: 'app_name',
      desc: 'Application Name',
      args: [],
    );
  }

  /// `Search`
  String get home_search_placeholder {
    return Intl.message(
      'Search',
      name: 'home_search_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Essentials deliver to you`
  String get home_store_category_heading {
    return Intl.message(
      'Essentials deliver to you',
      name: 'home_store_category_heading',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get nav_btn_home_text {
    return Intl.message(
      'Home',
      name: 'nav_btn_home_text',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get nav_btn_bag_text {
    return Intl.message(
      'Cart',
      name: 'nav_btn_bag_text',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get nav_btn_account_txt {
    return Intl.message(
      'Account',
      name: 'nav_btn_account_txt',
      desc: '',
      args: [],
    );
  }

  /// `Add to Bag`
  String get btn_add_to_cart {
    return Intl.message(
      'Add to Bag',
      name: 'btn_add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, currently we are not delivering to this location`
  String get delivery_no_available_msg {
    return Intl.message(
      'Sorry, currently we are not delivering to this location',
      name: 'delivery_no_available_msg',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'ml'),
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
