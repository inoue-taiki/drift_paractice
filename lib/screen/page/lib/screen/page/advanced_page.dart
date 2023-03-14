import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../page/top_page.dart';
import '../page/edit_page.dart';
import 'package:app/models/todo.dart';

class AdvancedPage extends ConsumerWidget {
  const AdvancedPage({Key? key}) : super(key: key); //一意なkeyを自動的に割り当てる

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider.notifier).state; //todoListとして定義し、todoListProviderの現在の状態を格納

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Todoリスト',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.white,
                  ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: ((context) => EditPage(todoList:todoList))),
                );
              },
              icon: Icon(Icons.edit),
            ),
          ],
        ),
      ),
      body: ReorderableListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            key: ValueKey(todoList[index]), //id
            title: Text(
              todoList[index].description,
              style: TextStyle(
                decoration:
                    todoList[index].completed ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
            trailing: todoList[index].completed ? Icon(Icons.check, color: Colors.green) : null,
            onTap: () {
              ref.read(todoListProvider.notifier).toggleCompleted(index);
            },
          );
        },
        itemCount: todoList.length, //todoList内のアイテム数
        //tidoList内の順番をドラッグした時に並び替える
        onReorder: (oldIndex, newIndex) {
          ref.read(todoListProvider.notifier).reorder(oldIndex, newIndex);
        },
      ),
    );
  }
}
