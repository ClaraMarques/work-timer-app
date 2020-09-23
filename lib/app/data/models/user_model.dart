import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
  User({
    @required this.email,
    this.id,
    @required this.name,
    @required this.photo,
  })  : assert(email != null),
        assert(id != null);

  /// The current user's email address.
  final String email;

  /// The current user's id.
  String id;

  /// The current user's name (display name).
  final String name;

  /// Url for the current user's photo.
  final String photo;

  /// Empty user which represents an unauthenticated user.
  static final empty = User(email: '', id: '', name: null, photo: null);

  void setId(String id) {
    this.id = id;
  }

  User.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        email = data['email'],
        photo = data['photo'];

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'photo': this.photo
    };
  }

  @override
  List<Object> get props => [email, id, name, photo];
}
