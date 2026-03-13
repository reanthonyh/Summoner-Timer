final class ApiException implements Exception {
  ApiException({
    required this.message,
    this.statusCode,
    this.responseBody,
    this.errorType,
  });

  final String message;
  final int? statusCode;
  final String? responseBody;
  final String? errorType;

  @override
  String toString() {
    final buffer = StringBuffer(message);
    if (statusCode != null) {
      buffer.write(' (Status: $statusCode)');
    }
    if (errorType != null) {
      buffer.write(' - $errorType');
    }
    return buffer.toString();
  }
}
