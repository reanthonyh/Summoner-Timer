import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/domain/usecases/get_account_usecase.dart';
import 'search_event_state.dart';

final class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required GetAccountUseCase getAccountUseCase})
    : _getAccountUseCase = getAccountUseCase,
      super(SearchInitial()) {
    on<SearchSummonerEvent>(_onSearchSummoner);
  }

  final GetAccountUseCase _getAccountUseCase;

  Future<void> _onSearchSummoner(
    SearchSummonerEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());
    try {
      final account = await _getAccountUseCase(name: event.name, tag: event.tag);
      emit(SearchSuccess(account: account));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}
