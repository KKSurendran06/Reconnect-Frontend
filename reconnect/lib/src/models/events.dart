import 'dart:convert';
import 'package:http/http.dart' as http;

class Events {
    int colindex;
    String heading;
    String username;
    String passOutYear;
    String location;
    String eventDate;
    String description;
    String department;
    String eventTime;

    Events({
        required this.colindex,
        required this.heading,
        required this.username,
        required this.passOutYear,
        required this.location,
        required this.eventDate,
        required this.description,
        required this.department,
        required this.eventTime,
    });

    factory Events.fromJson(String str) => Events.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Events.fromMap(Map<String, dynamic> json) => Events(
        colindex: json["colindex"],
        heading: json["heading"],
        username: json["username"],
        passOutYear: json["pass_out_year"],
        location: json["location"],
        eventDate: json["event_date"],
        description: json["description"],
        department: json["department"],
        eventTime: json["event_time"],
    );

    Map<String, dynamic> toMap() => {
        "colindex": colindex,
        "heading": heading,
        "username": username,
        "pass_out_year": passOutYear,
        "location": location,
        "event_date": eventDate,
        "description": description,
        "department": department,
        "event_time": eventTime,
    };
}


List<Events> EventList = [
  Events(colindex: 2,
   heading: "meetup ",
    username: "gamma",
     passOutYear: "2017",
     location: "Kumaran hall, Delhi",
     eventDate: "12/12/12",
     description: "reuninon",
     department: "cse",
     eventTime: "10:00",
     ),
     Events(colindex: 2,
   heading: "reunion ",
    username: "gamma",
     passOutYear: "2017",
     location: "kollam",
     eventDate: "12/12/12",
     description: "meetuop",
     department: "cys",
     eventTime: "10:00"
     ),

];
List<Events> UpdatedEvents = EventList;


Future <List<Events>> getData() async {
  final response = await http.get(Uri.parse('http://192.168.181.30:8000/api/data/'));
  var data = jsonDecode(response.body.toString());
  print(data);
  print(("Status code is  === ${response.statusCode}"));
  if(response.statusCode == 200) {
    for(Map<String, dynamic> index in data){
       print(EventList.length);
      EventList.add(Events.fromMap(index));
      // print(EventList.length);
      // EventList.add(Events(colindex: Events.fromMap(index).colindex,
      //  heading: Events.fromMap(index).heading,
      //   username: Events.fromMap(index).username,
      //    passOutYear: Events.fromMap(index).passOutYear,
      //     location: Events.fromMap(index).location,
      //      eventDate: Events.fromMap(index).eventDate, 
      //      description: Events.fromMap(index).description,
      //       department: Events.fromMap(index).department,
      //        eventTime: Events.fromMap(index).eventTime));
    }
    // print(EventList[2].heading);
    return EventList;
  } else {
    return EventList;
  }
}