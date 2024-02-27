import 'package:for_shared_preferences/data/models/todo_model.dart';
import 'package:for_shared_preferences/main.dart';

abstract class Functions {
  ///get all todos from storage
  static List<ToDo> getTodos() {
    final List<ToDo> todos = localRepository.readTodo();
    return todos;
  }

  ///set todo to storage
  static Future<bool> setTodo(
      {required String title, required String desc}) async {
    int id = Functions.getTodos().length;
    final ToDo todo =
        ToDo(id: id, title: title, description: desc, dateTime: DateTime.now().toString());
    return await localRepository.storeTodo(todo);
  }

  ///delete todo from storage
  static Future<bool> deleteTodo({required int id}) async {
    return localRepository.deleteTodo(id);
  }

  ///update todo from storage
  static Future<bool> updateTodo(
      {required int id, String? title, String? desc}) async {
    final List<ToDo> todos = localRepository.readTodo();
    ToDo currentTodo = todos.firstWhere((element) => element.id == id);
    final ToDo todo = ToDo(
      id: id,
      title: title ?? currentTodo.title,
      description: desc ?? currentTodo.description,
      dateTime: DateTime.now().toString(),
    );
    return await localRepository.updateTodo(todo);
  }
}
