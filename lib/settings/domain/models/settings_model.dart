// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SettingsModel {
  String? s;
  int? n;
  SettingsModel({
    this.s,
    this.n,
  });

  SettingsModel copyWith({
    String? s,
    int? n,
  }) {
    return SettingsModel(
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

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      s: map['s'] != null ? map['s'] as String : null,
      n: map['n'] != null ? map['n'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsModel.fromJson(String source) => SettingsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SettingsModel(s: $s, n: $n)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SettingsModel &&
      other.s == s &&
      other.n == n;
  }

  @override
  int get hashCode => s.hashCode ^ n.hashCode;
}
