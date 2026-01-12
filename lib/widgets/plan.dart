import 'package:flutter/material.dart';
import 'package:todo_backend/fetchdata.dart';
import 'package:todo_backend/model.dart';

class Plan extends StatefulWidget {
  const Plan({super.key});

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  @override
  void initState() {
    super.initState();
    fetchapidata().then((_){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (db.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: db.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white, // 🔷 note background
              borderRadius: BorderRadius.circular(16),
              boxShadow: [ // 🔷 professional note shadow
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // 🔷 TITLE SECTION
                Row(
                  children: [
                    const Icon(Icons.edit_note, color: Colors.deepPurple), // 🔷 symbol
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        db[index].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // 🔷 Divider between title & description
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),

                const SizedBox(height: 10),

                // 🔷 DESCRIPTION SECTION
                Text(
                  db[index].description,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
