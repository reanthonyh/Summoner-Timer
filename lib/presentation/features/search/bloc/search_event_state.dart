import 'package:summoner_timer/domain/entities/entities.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class SearchSummonerEvent extends SearchEvent {
  const SearchSummonerEvent({required this.name, required this.tag});

  final String name;
  final String tag;
}

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  const SearchSuccess({required this.account});

  final Account account;
}

class SearchError extends SearchState {
  const SearchError({required this.message});

  final String message;
}
