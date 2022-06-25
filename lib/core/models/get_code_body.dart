import 'dart:io';

class GetValBody {
  String? key;
  String? value;
  String? type;

  GetValBody({this.key, this.value, this.type});

  GetValBody.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    data['type'] = type;
    return data;
  }
}