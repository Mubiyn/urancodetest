// this is the response class for all requests...

class ApiResponse {
  ApiResponse({
    this.data,
    this.error,
    this.message,
  });

  dynamic data;
  bool? error;
  String? message;
}
