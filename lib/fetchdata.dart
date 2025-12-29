import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:todo_backend/model.dart';
Future<void> fetchapidata() async{
  final url=Uri.parse("http://localhost:8000/api/all");
  final res= await http.get(url);
  if (res.statusCode==200){
    //my data is a overall map so i decode it from json.
    final Map<String,dynamic> decoded=json.decode(res.body);
    //inside map i have list named as data so i decode that one too.
     final List<dynamic> jsonList =decoded["data"];
     //now i have list of maps that is i mentioned as apidata.
     final List<Map<String,dynamic>> apidata =List<Map<String,dynamic>>.from(jsonList);
     // now i use to previously writed function to store apidata into my db named list to acess it.
     filldbtoapi(apidata);
  }
  else{
    throw Exception("fetching failed");
  }
}
// {
//   "data": [
//     {
//       "_id": "694f7733f2e40ae8cfdaa72e",
//       "title": "the first_one",
//       "description": "testing",
//       "endDate": "17-6-2005",
//       "taskaddedDate": "1766815533506",
//       "__v": 0
//     },
//     {
//       "_id": "694f7988f2e40ae8cfdaa730",
//       "title": "The Day",
//       "description": "Its going on smootly",
//       "endDate": "17-6-2005",
//       "taskaddedDate": "1766815533506",
//       "__v": 0
//     }
//   ]
// }