import 'dart:convert';

import 'package:courses/src/model/course_model.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final List<String> titles = [
  'Javascript: the complete guide',
  'Typescript: the complete guide',
  'Learn Angular 4 with Typescript',
  'Dart & Angular = AngularDart is awasome',
  'Learn Dart from google',
  'Learn CPMD with Flutter',
  'Firebase crash course',
  'Create Rest API with NodeJs',
  'Build a full API with Graphql',
  'Learn Deno the new tech',
];
final tags = <List<String>>[
  ['Javascript'],
  ['Typeccript'],
  ['Angular'],
  ['AngularDart'],
  ['Dart'],
  ['Flutter'],
  ['Firebase'],
  ['NodeJs'],
  ['Graphql'],
  ['Deno'],
];

class InMemoryData extends MockClient {
  static final uuid = Uuid();
  static List<Course> _coursesDB;

  InMemoryData() : super(_handler);
  static List<Map<String, dynamic>> _intialCourses() {
    List<Map<String, dynamic>> mockJson;
    for (var i = 0; i < 10; i++) {
      mockJson.add({
        'uid': uuid.v4(),
        'title': titles[i],
        'author': 'Mustafa Alroomi',
        'price': 0,
        'description': 'Full complete course',
        'duration': 2.2,
        'image': '',
        'lectures': ['Lecture1', 'Lecture2'],
        'tags': tags[i],
        'updateAt': DateFormat('dd/MM/yyyy').format(DateTime.now()),
      });
    }
    return mockJson;
  }

  static resetDb() {
    _coursesDB = _intialCourses()
        .map(
          (json) => Course.fromJson(json),
        )
        .toList();
  }

  static Future<Response> _handler(Request request) async {
    if (_coursesDB == null) resetDb();
    var data;

    switch (request.method) {
      case 'GET':
        final uid = request.url.pathSegments.last;
        if (uid != null && uid != 'courses' && uid.isNotEmpty) {
          // get single course
          data = _coursesDB.firstWhere((el) => (el.uid == uid));
        } else {
          var prefix = request.url.queryParameters['title'] ?? '';
          final reqExp = RegExp(prefix, caseSensitive: false);

          data = _coursesDB
              .where(
                (el) => (el.title.contains(reqExp)),
              )
              .toList();
        }
        break;
      case 'POST':
        var title = json.decode(request.body)['title'];
        var price = json.decode(request.body)['price'];
        var author = json.decode(request.body)['author'];
        var course = Course(uuid.v4(), title, author, price);

        _coursesDB.add(course);
        data = course;
        break;

      case 'PUT':
        var courseChanges = Course.fromJson(
          json.decode(request.body),
        );

        var targetCourse = _coursesDB.firstWhere(
          (cr) => (cr.uid == courseChanges.uid),
        );

        targetCourse.title = courseChanges.title;
        data = targetCourse;
        break;

      case 'DELETE':
        var uid = request.url.pathSegments.last;

        _coursesDB.removeWhere((el) => el.uid == uid);
        data = _coursesDB;
        break;
      default:
        throw 'Unimplemented HTTP method ${request.method}';
    }

    return Response(
      json.encode({'data': data}),
      200,
      headers: {'Content-Type': 'application/json'},
    );
  }
}
