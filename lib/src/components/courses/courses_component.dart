import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:courses/src/components/card/card_component.dart';
import 'package:courses/src/components/courses/course_service.dart';
import 'package:courses/src/model/course_model.dart';
import 'package:courses/src/utils/routes.dart';

@Component(
  selector: 'courses',
  templateUrl: './courses_template.html',
  directives: [coreDirectives, CourseCard],
  providers: [
    ClassProvider(CourseService),
  ],
)
class CoursesComponent implements OnInit {
  Course selected;

  final Router _router;
  final CourseService _courseService;

  CoursesComponent(this._router, this._courseService);

  List<Course> courses = [];

  void deleteItem(String uid) async {
    var course = this.courses.firstWhere((cr) => cr.uid == uid);
    if (selected == course) {
      selected = null;
    }
    await this._courseService.deleteCourse(uid);
    this.courses.removeWhere((element) => element.uid == uid);
  }

  @override
  void ngOnInit() async {
    courses = await this._courseService.getAll();
  }

  Future<NavigationResult> viewDetail(Course course) async {
    selected = course;
    return await _router.navigate(_courseURl(selected.uid));
  }

  String _courseURl(String uid) {
    return RoutePaths.course_detail.toUrl(
      parameters: {idParam: uid},
    );
  }
}
