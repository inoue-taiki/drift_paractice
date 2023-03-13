import 'package:drift/drift.dart';
import 'dart:io'; 
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';


//ファイル名.g.dartで記載(エラーはファイル自動生成によって消える)
part 'todos.g.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

//DBクラスの定義　DBクラスとテーブルを紐づける
@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  //DBのインスタンス生成・DBとの接続処理
  MyDatabase() : super(_openConnection()); 
  //DBのバージョン指定
  @override  
  int get schemaVersion => 1; 
  
  //streamでデータ取得
  Stream<List<Todo>> watchEntries() {
    return (select(todos)).watch();
  }
  //Futureでデータ取得
  Future<List<Todo>> get allTodoEntries => select(todos).get();
}

//DBの保存位置を取得・設定
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}