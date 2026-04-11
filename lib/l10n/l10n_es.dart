// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get search_title => 'Buscar tu Cuenta';

  @override
  String get seach_name_label => 'Nombre del Juego';

  @override
  String get search_name_placeholder => 'e.g. Nombre#1234';

  @override
  String get search_name_invalid => 'El nombre del juego no es válido';

  @override
  String get search_tag_label => 'Etiqueta';

  @override
  String get search_tag_placeholder => 'e.g. LAN';

  @override
  String get search_tag_invalid => 'La etiqueta del juego no es válida';

  @override
  String get search_recent_accounts => 'Cuentas Recientes';

  @override
  String get search_button => 'Buscar';

  @override
  String get search_no_recent_accounts => 'No se encontraron cuentas recientes';

  @override
  String get general_error => 'Se ha producido un error';

  @override
  String get profile_title => 'Perfil';

  @override
  String profile_level(int level) {
    return 'Nivel $level';
  }

  @override
  String get profile_search_game => 'Buscar Partida en Vivo';

  @override
  String get profile_change_account => 'Cambiar Cuenta';

  @override
  String get game_not_in_game => 'No se encontró una partida activa';

  @override
  String get game_retry => 'Reintentar';

  @override
  String get game_ally_team => 'Equipo Aliado';

  @override
  String get game_enemy_team => 'Equipo Rival';

  @override
  String get game_live_title => 'Partida en Vivo';
}
