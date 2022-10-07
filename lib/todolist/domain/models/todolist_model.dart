// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodolistModel {
  String? task;
  bool? completed;
  TodolistModel({
    this.task,
    this.completed = false,
  });

  // TodolistModel copyWith({
  //   String? task,
  //   int? completed,
  // }) {
  //   return TodolistModel(
  //     task: task ?? this.task,
  //     completed: completed ?? this.completed,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'task': task,
      'completed': completed,
    };
  }

  factory TodolistModel.fromMap(Map<String, dynamic> map) {
    return TodolistModel(
      task: map['task'] != null ? map['task'] as String : null,
      completed: map['completed'] != null ? map['completed'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodolistModel.fromJson(String source) =>
      TodolistModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TodolistModel(task: $task, completed: $completed)';

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is TodolistModel &&
  //       other.task == task &&
  //       other.completed == completed;
  // }

  // @override
  // int get hashCode => task.hashCode ^ completed.hashCode;
}
