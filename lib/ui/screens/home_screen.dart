import 'package:flutter/material.dart';
import 'package:for_shared_preferences/data/models/todo_model.dart';
import 'package:for_shared_preferences/domain/functions/functions.dart';
import 'package:for_shared_preferences/ui/widgets/custom_dialog.dart';
import 'package:for_shared_preferences/ui/widgets/custom_edit_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<ToDo> todos = Functions.getTodos();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade300,
        elevation: 50,
        shadowColor: Colors.green.shade300,
        centerTitle: true,
        title: const Text(
          "ToDoS",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.3),
              spreadRadius: 30,
              blurRadius: 40,
            )
          ],
        ),
        child: BottomAppBar(
          height: 80,
          shape: const CircularNotchedRectangle(),
          notchMargin: 0,
          color: Colors.green.shade300,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) => Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: EdgeInsets.only(top: index == 0 ? 25 : 15,
            bottom: index == todos.length - 1 ? 25 : 0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {
                      Functions.deleteTodo(id: todos[index].id);
                      setState(() {

                      });
                  }, child: Image.asset("assets/images/img_remove.png", width: 50,color: Colors.red,)),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        todos[index].title,
                        style: const TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        todos[index].description,
                        style:  TextStyle(color: Colors.green.shade300, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        todos[index].dateTime.split(" ").first,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  TextButton(  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomEditDialog(title: todos[index].title, desc: todos[index].description, id: todos[index].id),
                    );
                  }, child: Image.asset("assets/images/img_edit.png", width: 50,color: Colors.orange,)),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const CustomDialog(),
            );
          },
          child: Image.asset(
            "assets/images/img_add.png",
            color: Colors.green.shade300,
          ),
        ),
      ),
    );
  }
}
