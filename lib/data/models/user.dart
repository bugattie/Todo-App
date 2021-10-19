import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;

  const UserModel({required this.name, required this.email});

  UserModel.fromJson(DocumentSnapshot json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}
