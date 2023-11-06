// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Move {
  final String id;
  final String name;
  Icon? icon;
  Move({
    required this.id,
    required this.name,
    this.icon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Move.fromMap(Map<String, dynamic> map) {
    return Move(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Move.fromJson(String source) => Move.fromMap(json.decode(source) as Map<String, dynamic>);
}
