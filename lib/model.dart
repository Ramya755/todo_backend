class Data {
  final String title;
  final String description;
  Data({required this.title, required this.description});
  //here i create function that will convert map to data(the class model i created)
  static Data convertmaptodata(Map<String,dynamic> map){
    return Data(title:map["title"],description:map["description"]);
  }
}

List<Data> db =[
];

void filldbtoapi(List<Map<String,dynamic>> apidata){
    db.clear();
    for(var item in apidata){
      Data d=Data.convertmaptodata(item);
      db.add(d);
    }
  }
// {
//   "data": [
//     {     
//       "title": "the first_one",
//       "description": "testing",     
//     },
//     {
//  
//       "title": "The Day",
//       "description": "Its going on smootly",
//     }
//   ]
// }




// this is what i have now i use convertmaptodata in my code to convert a map {
//  
//       "title": "The Day",
//       "description": "Its going on smootly",
//     }
// this to Data (dart object),next step to 
// i use filldbtoapi for in my original information from backend i have list of maps but i write map to data function that
// is convertmaptodata so this filldbtoapi deals with overall list of maps.
