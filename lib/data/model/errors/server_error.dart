class ServerErrorResponse {
  dynamic? status;
  String? statustext;
  String? message;

  ServerErrorResponse({
    this.status,
    this.statustext,
    this.message,
  });

  ServerErrorResponse.fromJson(Map<String, dynamic> json) {
    statustext = json['status'];
    status = json['statustext'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statustext'] = this.status;
    data['status'] = this.statustext;
    data['message'] = this.message;

    return data;
  }
}
