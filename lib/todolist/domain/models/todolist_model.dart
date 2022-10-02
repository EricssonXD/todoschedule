// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodolistModel {
  String? s;
  int? n;
  TodolistModel({
    this.s,
    this.n,
  });

  TodolistModel copyWith({
    String? s,
    int? n,
  }) {
    return TodolistModel(
      s: s ?? this.s,
      n: n ?? this.n,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      's': s,
      'n': n,
    };
  }

  factory TodolistModel.fromMap(Map<String, dynamic> map) {
    return TodolistModel(
      s: map['s'] != null ? map['s'] as String : null,
      n: map['n'] != null ? map['n'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodolistModel.fromJson(String source) => TodolistModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TodolistModel(s: $s, n: $n)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TodolistModel &&
      other.s == s &&
      other.n == n;
  }

  @override
  int get hashCode => s.hashCode ^ n.hashCode;
}
