import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summoner_timer/domain/entities/entities.dart';

abstract interface class LocalAccountDataSource {
  Future<List<Account>> getSavedAccounts();
  Future<void> saveAccount(Account account);
}

final class LocalAccountDataSourceImpl implements LocalAccountDataSource {
  static const _accountsKey = 'saved_accounts_v2';

  @override
  Future<List<Account>> getSavedAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    final accountsJson = prefs.getStringList(_accountsKey) ?? [];

    return accountsJson
        .map((json) {
          try {
            return Account.fromJson(jsonDecode(json));
          } catch (e) {
            print('LocalAccountDataSource: Error parsing account: $e');
            return null;
          }
        })
        .whereType<Account>()
        .toList();
  }

  @override
  Future<void> saveAccount(Account account) async {
    final prefs = await SharedPreferences.getInstance();
    final accounts = await getSavedAccounts();

    // Avoid duplicates
    final filtered = accounts.where((a) => a.puuid != account.puuid).toList();
    filtered.insert(0, account);

    final encoded = filtered.map((a) => jsonEncode(a.toJson())).toList();
    await prefs.setStringList(_accountsKey, encoded);
  }
}
