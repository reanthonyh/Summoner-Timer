enum UiStatus { initial, error, loading, success }

extension UiStatusCubitExtension on UiStatus {
  bool get isLoading => this == .loading;
  bool get isSuccess => this == .success;
  bool get isError => this == .error;
}
