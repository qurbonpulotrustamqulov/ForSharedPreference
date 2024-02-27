import 'dart:convert';

import 'package:for_shared_preferences/data/models/todo_model.dart';
import 'package:for_shared_preferences/services/shared_preference_service/shared_preference_service.dart';

abstract class LocalRepository {
  Future<bool> storeTodo(ToDo todo);

  List<ToDo> readTodo();

  Future<bool> deleteTodo(int id);

  Future<bool> updateTodo(ToDo toDo);
}

class LocalRepositoryImpl implements LocalRepository {
  final LocalDataSource dataSource;

  const LocalRepositoryImpl({required this.dataSource});

  ///For get all saved todos
  @override
  List<ToDo> readTodo() {
    String data = dataSource.read(StorageKey.saved) ?? "[]";
    final json = jsonDecode(data) as List;
    return json
        .map((item) => ToDo.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  ///For store new todo
  @override
  Future<bool> storeTodo(ToDo toDo) {
    final list = readTodo();
    list.add(toDo);
    list.sort((a, b) => a.id.compareTo(b.id));
    final json = list.map((product) => product.toJson()).toList();
    final data = jsonEncode(json);
    return dataSource.store(StorageKey.saved.name, data);
  }

  ///For delete todo
  @override
  Future<bool> deleteTodo(int id) {
    final List<ToDo> list = readTodo();
    list.removeWhere((element) => element.id == id);
    final json = list.map((element) => element.toJson()).toList();
    final data = jsonEncode(json);
    return dataSource.store(StorageKey.saved.name, data);
  }

  ///For update todo
  @override
  Future<bool> updateTodo(ToDo toDo) {
    final List<ToDo> list = readTodo();
    list.removeWhere((element) => element.id == toDo.id);
    list.add(toDo);
    list.sort((a, b) => a.id.compareTo(b.id));
    final json = list.map((element) => element.toJson()).toList();
    final data = jsonEncode(json);
    return dataSource.store(StorageKey.saved.name, data);
  }
}
