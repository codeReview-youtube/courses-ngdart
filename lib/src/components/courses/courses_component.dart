import 'package:angular/angular.dart';
import 'package:courses/src/components/card/card_component.dart';
import 'package:courses/src/model/course_model.dart';

@Component(
  selector: 'courses',
  templateUrl: './courses_template.html',
  directives: [coreDirectives, CourseCard],
  providers: [],
)
class CoursesComponent {
  List<Course> courses = [
    Course(
      '111',
      'Javascript: the complete  course',
      'CodeReview',
      19.99,
      'Full understanding of Javascript ecosystem',
      10,
      'assets/images/1.png',
      ['Lecture1', 'Lecture2'],
      ['Javascript', 'programming'],
      DateTime.now().toIso8601String(),
    ),
    Course(
      '112',
      'Javascript: the complete  course',
      'CodeReview',
      19.99,
      'Full understanding of Javascript ecosystem',
      10,
      'assets/images/2.png',
      ['Lecture1', 'Lecture2'],
      ['Javascript', 'programming'],
      DateTime.now().toIso8601String().substring(
            0,
          ),
    ),
  ];
  void deleteItem(String uid) {
    courses.removeWhere((course) => course.uid == uid);
  }
}
