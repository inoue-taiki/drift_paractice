import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../page/advanced_page.dart';
import 'package:app/models/todo.dart';

class EditPage extends ConsumerWidget {
  //前ページからのデータ受け取り
  final List<Todo> todoList;
  const EditPage({Key? key, required this.todoList}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Todoリスト'),
        leading: null,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.add),
              title: Text('タスクを追加'),
              onTap: () {
                final newTodo = Todo(description: "task", id: todoList.length + 1);//最後の番号+1のidを自動的に付与する
                ref.read(todoListProvider.notifier).add(newTodo.description);//addメソッド呼び出して追加処理
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final todo = todoList[index];
                return ListTile(
                  title: Text(todo.description),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      //todoListProviderを監視し、押下時該当アイテムを削除
                      ref.read(todoListProvider.notifier).removeAt(index);
                    },
                  ),
                  onTap: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String updatedDescription = todo.description;
                        return AlertDialog(
                          title: Text('タスク編集'),
                          content: TextField(
                            controller: TextEditingController(text: updatedDescription),
                            onChanged: (value) {
                              updatedDescription = value;
                            },
                          ),
                          actions: [
                            TextButton(
                              child: Text('キャンセル'),
                              onPressed: () {
                                Navigator.of(context).pop();//何もなし
                              },
                            ),
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                ref.read(todoListProvider.notifier).updateTodo(index, updatedDescription);
                                Navigator.of(context).pop(updatedDescription);//更新内容を前ページに反映させる
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
              itemCount: todoList.length,
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.add),
              title: Text('タスクを追加'),
              onTap: () {
                // 追加処理
              },
            ),
          ),
        ],
      ),
    );
  }
}