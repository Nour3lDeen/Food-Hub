class UserModel {
  String? name;
  String? email;
  String? uid;
  UserModel({
    required this.name,
    required this.email,
    required this.uid,
  });
 UserModel.fromJson(Map<String, dynamic> json) {
   name = json['name'];
   email = json['email'];
   uid = json['uid'];
 }
 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = <String, dynamic>{};
   data['name'] = name;
   data['email'] = email;
   data['uid'] = uid;
   return data;
 }}