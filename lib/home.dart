import 'package:flutter/material.dart';
import 'package:todo_backend/fetchdata.dart';
import 'package:todo_backend/widgets/addtodo.dart';
import 'package:todo_backend/widgets/plan.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    await fetchapidata();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 179, 238),
      appBar: AppBar(title: Text("ToDo")),
      body: loading ? const Center(child: CircularProgressIndicator()) : Plan(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Addtask()),
          );
          if (result == true) {
            load();
          }
        },
        child: Icon(Icons.add, size: 25),
      ),
    );
  }
}
