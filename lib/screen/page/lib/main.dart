import 'package:app/screen/page/drift_sample.dart';
import 'package:app/screen/page/top_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/drift/todos.dart';

void main() {
  final database = MyDatabase();
  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  const MyApp({Key?key, required this.database}):super(key: key);

  final MyDatabase database;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'My App',
        home: DriftSample(database:database),
      ),
    );
  }
}


