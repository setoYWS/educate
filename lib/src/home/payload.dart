class Payload {
  String? id;
  String? name;
  String? roles;
  int? iat;

  Payload({this.id, this.name, this.roles, this.iat});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['username'];
    roles = json['roles'];
    iat = json['iat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = id;
    data['username'] = name;
    data['roles'] = roles;
    data['iat'] = iat;
    return data;
  }
}
