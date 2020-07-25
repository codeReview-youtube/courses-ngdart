import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:courses/src/components/card/card_component.dart';
import 'package:courses/src/components/courses/course_service.dart';
import 'package:courses/src/model/course_model.dart';
import 'package:courses/src/utils/routes.dart';

@Component(
  selector: 'course-detail',
  directives: [
    coreDirectives,
    CourseCard,
    formDirectives,
  ],
  providers: [ClassProvider(CourseService)],
  templateUrl: './course_detail_template.html',
)
class CourseDetail implements OnActivate {
  final CourseService _courseService;
  final Location _location;
  Course selected;
  bool editMode = false;

  CourseDetail(this._courseService, this._location);

  @override
  void onActivate(RouterState previous, RouterState current) async {
    final uid = getId(current.parameters);
    if (uid != null) {
      selected = await this._courseService.getSingle(uid);
    }
  }

  void deleteCourse() {
    this._courseService.deleteCourse(selected.uid);
    this._location.back();
  }

  void enrolCourse() {
    this._courseService.enroll(selected);
  }

  void update() {
    this._courseService.updateCourse(selected);
  }
}
