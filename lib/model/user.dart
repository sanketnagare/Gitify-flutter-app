import 'package:flutter/scheduler.dart';

class User {
  String? username;
  String? name;
  String imageUrl;
  int? followings;
  int? followers;
  int? public_repos;
  String? joined_date;
  String? location;
  String? url;
  String? email;
  String? company;
  // String bio;

  User({
    this.username,
    required this.imageUrl,
    this.followings,
    this.followers,
    this.public_repos,
    this.joined_date,
    this.name,
    this.location,
    this.url,
    this.email,
    this.company,
    // required this.bio,
  });
}
