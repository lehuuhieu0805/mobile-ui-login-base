class CustomException implements Exception {
  String cause;
  int statusCode;

  CustomException(this.cause, this.statusCode);
}
