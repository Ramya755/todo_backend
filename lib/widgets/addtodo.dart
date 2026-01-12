import 'package:flutter/material.dart';
import 'package:todo_backend/post.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  TextEditingController titlectrl = TextEditingController();
  TextEditingController desctrl = TextEditingController();
  TextEditingController datectrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2, // 🔷
        title: const Text(
          "Add Task",
          style: TextStyle(fontWeight: FontWeight.bold), // 🔷
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.all(16), // 🔷
          decoration: BoxDecoration(
            color: Colors.white, // 🔷
            borderRadius: BorderRadius.circular(20),
            boxShadow: [ // 🔷
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start, // 🔷
            children: [

              // 🔷 TITLE FIELD
              const Text(
                "Title",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: titlectrl,
                decoration: const InputDecoration(
                  hintText: "Enter title",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              // 🔷 DESCRIPTION FIELD
              const Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: desctrl,
                maxLines: 3, // 🔷
                decoration: const InputDecoration(
                  hintText: "Enter description",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              // 🔷 DATE FIELD
              const Text(
                "End Date",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: datectrl,
                decoration: const InputDecoration(
                  hintText: "DD / MM / YYYY",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // 🔷 SUBMIT BUTTON
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12), // 🔷
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // 🔷
                    ),
                  ),
                  onPressed: () async {
                    print("submit button pressed");
                    await Addd(
                      titlectrl.text,
                      desctrl.text,
                      datectrl.text,
                    );
                    Navigator.pop(context, true);
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 14, // 🔷
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
