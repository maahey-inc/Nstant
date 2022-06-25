
class GetCodeResponse {
  String? message;
  String? msg;


  GetCodeResponse({this.message,  this.msg});

  GetCodeResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    msg = json['msg'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['msg'] = msg;

    return data;
  }
}