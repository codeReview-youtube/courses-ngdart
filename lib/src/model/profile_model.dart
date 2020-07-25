import 'package:courses/src/model/course_model.dart';

class Profile {
  String uid;
  String name;
  String email;
  String image;
  List<Course> courses;
  List<Course> finishedCourses;
  String badge;
  String updateAt = DateTime.now().toIso8601String();

  Profile(
    this.uid,
    this.name,
    this.email,
    this.image, [
    this.badge = 'golden',
    this.courses = const [],
    this.finishedCourses = const [],
    this.updateAt,
  ]);
}
