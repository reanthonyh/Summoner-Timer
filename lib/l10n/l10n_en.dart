// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get search_title => 'Search your Account';

  @override
  String get seach_name_label => 'Game Name';

  @override
  String get search_name_placeholder => 'e.g. Name#1234';

  @override
  String get search_name_invalid => 'Riot Name is invalid';

  @override
  String get search_tag_label => 'Tag';

  @override
  String get search_tag_placeholder => 'e.g LAN';

  @override
  String get search_tag_invalid => 'Riot Tag is invalid';

  @override
  String get search_recent_accounts => 'Recent Accounts';

  @override
  String get search_button => 'Search';

  @override
  String get search_no_recent_accounts => 'No recent accounts found';

  @override
  String get general_error => 'An error happend';

  @override
  String get profile_title => 'Profile';

  @override
  String profile_level(int level) {
    return 'Level $level';
  }

  @override
  String get profile_search_game => 'Find Live Game';

  @override
  String get profile_change_account => 'Change Account';

  @override
  String get profile_not_in_game => 'Not currently in a game';
}
