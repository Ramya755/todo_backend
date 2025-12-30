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
      appBar: AppBar(title: Center(child: Text("Add Task"))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blue),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titlectrl,
                decoration: InputDecoration(labelText: "Title",border: OutlineInputBorder(),
),
              ),
              SizedBox(height: 10),
              TextField(
                controller: desctrl,
                decoration: InputDecoration(labelText: "Description",border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              TextField(
                controller: datectrl,
                decoration: InputDecoration(labelText: "enddate",border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              ElevatedButton(  
                onPressed: () async{
                  print("submit button pressed");
                  await Addd(
                    titlectrl.text,
                    desctrl.text,
                    datectrl.text
                  ); 
                  Navigator.pop(context,true);
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: "popins",
                    fontWeight: FontWeight.bold,
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
