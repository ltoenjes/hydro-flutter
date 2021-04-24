import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  const User({
    this.email,
    required this.id,
    this.name,
    this.photo,
  });

  User copyWith({
    String? email,
    String? id,
    String? name,
    String? photo,
  }) {
    return User(
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  /// Anonymous user which represents an unauthenticated user.
  static const anonymous = User(id: '');

  /// Convenience getter to determine whether the current user is anonymous.
  bool get isAnonymous => this == User.anonymous;

  /// Convenience getter to determine whether the current user is not anonymous.
  bool get isNotAnonymous => this != User.anonymous;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'id': id,
      'name': name,
      'photo': photo,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      id: map['id'],
      name: map['name'],
      photo: map['photo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, id, name, photo];
}
