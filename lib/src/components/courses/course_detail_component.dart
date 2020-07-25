import 'package:angular/angular.dart';
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
  ],
  providers: [ClassProvider(CourseService)],
  template: '''
  <div class='row'>
    <p *ngIf='selected == null'>
      No Selected Course or unknown
    </p>
    <course-card
            *ngIf='selected != null'
            (onDelete)="deleteCourse()"
            (onViewDetail)="enrollCourse()"
            firstBtnTitle="Enroll"
            [selectedCourse]='selected'>
    </course-card>
  </div>
        ''',
)
class CourseDetail implements OnActivate {
  final CourseService _courseService;
  final Location _location;
  Course selected;

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

  void enrollCourse() {
    this._courseService.enroll(selected);
  }
}
