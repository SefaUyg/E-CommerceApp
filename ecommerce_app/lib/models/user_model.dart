import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String country;
  final String groupName;
  final String skills;

  const User({
    this.id,
    this.fullName = '',
    this.email = '',
    this.address = '',
    this.city = '',
    this.country = '',
    this.groupName ='',
    this.skills = '',
  });

  User copyWith({
    String? id,
    String? fullName,
    String? email,
    String? address,
    String? city,
    String? country,
    String? groupName,
    String? skills,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      groupName: groupName ?? this.groupName,
      skills: skills ?? this.skills,
    );
  }

  factory User.fromJson(Map<String, dynamic> json, [String? id]) {
    return User(
      id: id ?? json['id'],
      fullName: json['fullName'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      groupName: json['groupName'],
      skills: json['skills']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'fullName': fullName,
      'email': email,
      'address': address,
      'city': city,
      'country': country,
      'groupName': groupName,
      'skills': skills,
    };
  }

  static const empty = User(id: '');

  @override
  List<Object?> get props =>
      [id, fullName, email, address, city, country, groupName, skills];
}
