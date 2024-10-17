import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



Future fetchCourse() async {
  final response = await http.get(Uri.parse('https://dhruvin.pythonanywhere.com/showdata/CA102'));

  // Appropriate action depending upon the
  // server response
  if (response.statusCode == 200) {
    return Course.fromJson(jsonDecode(response.body) as Map);
  } else {
    throw Exception('Failed to load Data!');
  }
}

class Course {

  final String coursecode;
  final String coursename;
  final String cincharge;

  const Course({
    required this.coursecode,
    required this.coursename,
    required this.cincharge,

  });

  factory Course.fromJson(Map json) {
    return Course(

      coursecode: json['coursecode'] as String,
      coursename: json['coursename'] as String,
      cincharge: json['cincharge'] as String,
    );
  }
}



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}



class _MyAppState extends State {
  late Future futureCourse;

  @override
  void initState() {
    super.initState();
    futureCourse = fetchCourse();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetching Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('W3TechBlog'),
        ),
        body: Center(
          child: FutureBuilder(
            future: futureCourse,
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                return (Text(snapshot.data!.cincharge));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}




//
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// // Fetch course data from the API
// Future<Course> fetchCourse() async {
//   final response = await http.get(Uri.parse('https://dhruvin.pythonanywhere.com/showdata/CA102'));
//
//   // Appropriate action depending on the server response
//   if (response.statusCode == 200) {
//     return Course.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     throw Exception('Failed to load Data!');
//   }
// }
//
// // Model class for Course
// class Course {
//   final String coursecode;
//   final String coursename;
//   final String cincharge;
//
//   const Course({
//     required this.coursecode,
//     required this.coursename,
//     required this.cincharge,
//   });
//
//   // Factory constructor to convert JSON into a Course object
//   factory Course.fromJson(Map<String, dynamic> json) {
//     return Course(
//       coursecode: json['coursecode'] as String,
//       coursename: json['coursename'] as String,
//       cincharge: json['cincharge'] as String,
//     );
//   }
// }
//
// // Main function to run the app
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late Future<Course> futureCourse;
//
//   @override
//   void initState() {
//     super.initState();
//     futureCourse = fetchCourse();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetching Data',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('W3TechBlog'),
//         ),
//         body: Center(
//           child: FutureBuilder<Course>(
//             future: futureCourse,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator(); // Show loading indicator
//               } else if (snapshot.hasError) {
//                 return Text("Error: ${snapshot.error}");
//               } else if (snapshot.hasData) {
//                 return Text(snapshot.data!.cincharge); // Display data if available
//               } else {
//                 return Text('No data found');
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
