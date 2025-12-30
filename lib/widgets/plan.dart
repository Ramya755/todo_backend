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
    //here i am fetching api data and sending into db that is list i created
    fetchapidata().then((_){
      setState(() {
        
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    if (db.isEmpty){
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: db.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    db[index].title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    db[index].description,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
