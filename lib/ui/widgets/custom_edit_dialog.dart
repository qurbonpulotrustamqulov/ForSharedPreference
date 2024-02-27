import 'package:flutter/material.dart';
import 'package:for_shared_preferences/domain/functions/functions.dart';
import 'package:for_shared_preferences/ui/screens/home_screen.dart';

class CustomEditDialog extends StatefulWidget {
  int id;
 String title;
 String desc;
   CustomEditDialog({super.key, required this.title, required this.desc, required this.id});

  @override
  State<CustomEditDialog> createState() => _CustomEditDialogState();
}

class _CustomEditDialogState extends State<CustomEditDialog> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  void initState() {
    titleController = TextEditingController(text: widget.title);
    descController = TextEditingController(text: widget.desc);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 360,
        width: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Add ToDo",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green.shade300),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: descController,
              decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Bekor qilish",
                    style: TextStyle(
                        color: Colors.red.shade300,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: titleController.text.isEmpty &&
                      descController.text.isEmpty
                      ? null
                      : () {
                    Functions.updateTodo(
                      id: widget.id,
                        title: titleController.text,
                        desc: descController.text);

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                            (route) => false);
                  },
                  child: Text(
                    "Saqlash",
                    style: TextStyle(
                        color: (titleController.text.isEmpty &&
                            descController.text.isEmpty)
                            ? Colors.grey.shade300
                            : Colors.green.shade300,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
