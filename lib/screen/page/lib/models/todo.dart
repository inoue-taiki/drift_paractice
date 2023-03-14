import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

// 不変のクラス
@immutable
class Todo {
  const Todo({
    required this.id,
    required this.description,
    this.completed = false,
  });

  final int id;
  final String description;
  final bool completed;

  Todo copyWith({
    String? description,
    bool? completed,
  }) {
    return Todo(
      id: this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}

final List<Todo> todoList = [
  Todo(id: 1, description: 'task1', completed: false),
  Todo(id: 2, description: 'task2', completed: false),
  Todo(id: 3, description: 'task3', completed: false),
];

// TodoListNotifierを定義
class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super(todoList); // TodoListNotifierを空のリストとして初期化

  // 追加メソッド
  void add(String description) {
    final newTodo = Todo(
      id: state.length + 1,
      description: description,
      completed: false,
    );
    state = [...state, newTodo];
  }

  // 削除メソッド
  void removeAt(int index) {
    state = List.from(state)..removeAt(index);
  }

  // 順序変更メソッド
  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final todo = state.removeAt(oldIndex);
    state.insert(newIndex, todo);
  }

  // toggleCompletedメソッド
  void toggleCompleted(int index) {
    final item = state[index];
    final newItem = item.copyWith(completed: !item.completed);
    final newTodoList = List<Todo>.from(state);
    newTodoList[index] = newItem;
    state = newTodoList;
  }

  // 更新メソッド
  void updateTodo(int index, String newDescription) {
    final todoToUpdate = state[index];
    final newTodo = todoToUpdate.copyWith(description: newDescription);
    state = List.from(state)..[index] = newTodo;
  }
}

// TodoListNotifierを使うためにtodoListProviderを作成
final todoListProvider = StateNotifierProvider((ref) => TodoListNotifier());
