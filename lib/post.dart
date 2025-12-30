import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> Addd(String title, String description,String endDate) async {
  final url = Uri.parse("http://localhost:8000/api/add");
  print("url cleared");

  final response = await http.post(   
    url,
    body: jsonEncode({
      "title": title,
      "description": description,
      "endDate":endDate
      //this are things i made as required in my mongoose schema
    }),
    headers: {"Content-Type": "application/json"},
  );

  print("STATUS CODE: ${response.statusCode}"); 
  print("RESPONSE BODY: ${response.body}");     
  print("finihed");
}
