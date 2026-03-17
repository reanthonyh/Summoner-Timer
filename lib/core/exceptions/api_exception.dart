final class ApiException implements Exception {
  ApiException({required this.message, this.statusCode, this.responseBody});

  final String message;
  final int? statusCode;
  final String? responseBody;

  @override
  String toString() {
    final buffer = StringBuffer(message);

    if (statusCode != null) {
      buffer.write(' (Status: $statusCode)');
    }

    return buffer.toString();
  }
}
