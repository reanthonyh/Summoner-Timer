enum UiStatus { initial, error, loading, success }

extension UiStatusCubitExtension on UiStatus {
  bool get isLoading => this == .loading;
  bool get isSuccess => this == .success;
}
