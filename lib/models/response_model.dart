class ResponseModel {
  final int status;
  final bool success;
  final String message;
  dynamic data;
  // String userId;

  ResponseModel({
    required this.status,
    required this.success,
    required this.message,
    this.data,
    // required this.userId,
  });

  factory ResponseModel.fromJson(dynamic json) {
    return ResponseModel(
      status: json['status'],
      success: json['success'],
      message: json['message'],
      data: json['data'],

      // userId: json['data']['userId'],
    );
  }
}
