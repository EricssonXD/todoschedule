// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FrameModel {
  String? s;
  int? n;
  FrameModel({
    this.s,
    this.n,
  });

  FrameModel copyWith({
    String? s,
    int? n,
  }) {
    return FrameModel(
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

  factory FrameModel.fromMap(Map<String, dynamic> map) {
    return FrameModel(
      s: map['s'] != null ? map['s'] as String : null,
      n: map['n'] != null ? map['n'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FrameModel.fromJson(String source) => FrameModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FrameModel(s: $s, n: $n)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FrameModel &&
      other.s == s &&
      other.n == n;
  }

  @override
  int get hashCode => s.hashCode ^ n.hashCode;
}
