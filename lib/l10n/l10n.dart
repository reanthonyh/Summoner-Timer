import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Title - Search Page
  ///
  /// In en, this message translates to:
  /// **'Search your Account'**
  String get search_title;

  /// Label Name - Search Page
  ///
  /// In en, this message translates to:
  /// **'Game Name'**
  String get seach_name_label;

  /// Placeholder Name - Search Page
  ///
  /// In en, this message translates to:
  /// **'e.g. Name#1234'**
  String get search_name_placeholder;

  /// Invalid Text - Search Page
  ///
  /// In en, this message translates to:
  /// **'Riot Name is invalid'**
  String get search_name_invalid;

  /// Label Tag - Search Page
  ///
  /// In en, this message translates to:
  /// **'Tag'**
  String get search_tag_label;

  /// Placeholder Tag - Search Page
  ///
  /// In en, this message translates to:
  /// **'e.g LAN'**
  String get search_tag_placeholder;

  /// Invalid Text - Search Page
  ///
  /// In en, this message translates to:
  /// **'Riot Tag is invalid'**
  String get search_tag_invalid;

  ///  Recent Accounts Subtitle - Search Page
  ///
  /// In en, this message translates to:
  /// **'Recent Accounts'**
  String get search_recent_accounts;

  /// Button - Search Page
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search_button;

  /// No recent accounts message - Search Page
  ///
  /// In en, this message translates to:
  /// **'No recent accounts found'**
  String get search_no_recent_accounts;

  /// Genral Error Message - Message
  ///
  /// In en, this message translates to:
  /// **'An error happend'**
  String get general_error;

  /// Title - Profile Page
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile_title;

  /// Level indicator - Profile Page
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String profile_level(int level);

  /// Search Game Button - Profile Page
  ///
  /// In en, this message translates to:
  /// **'Find Live Game'**
  String get profile_search_game;

  /// Change Account Button - Profile Page
  ///
  /// In en, this message translates to:
  /// **'Change Account'**
  String get profile_change_account;

  /// In game check - Profile Page
  ///
  /// In en, this message translates to:
  /// **'Not currently in a game'**
  String get profile_not_in_game;

  /// Title when no game is found - Game Page
  ///
  /// In en, this message translates to:
  /// **'No active game found'**
  String get game_not_in_game;

  /// Retry button - Game Page
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get game_retry;

  /// Ally team label - Game Page
  ///
  /// In en, this message translates to:
  /// **'Ally Team'**
  String get game_ally_team;

  /// Enemy team label - Game Page
  ///
  /// In en, this message translates to:
  /// **'Enemy Team'**
  String get game_enemy_team;

  /// Title - Live Game Page
  ///
  /// In en, this message translates to:
  /// **'Live Game'**
  String get game_live_title;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
