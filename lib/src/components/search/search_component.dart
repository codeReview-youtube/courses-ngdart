import 'dart:async';

import 'package:angular/angular.dart';
import 'package:courses/src/utils/routes.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:angular_router/angular_router.dart';
import 'package:courses/src/components/courses/course_service.dart';
import 'package:courses/src/model/course_model.dart';

@Component(
  selector: 'search-courses',
  templateUrl: './search_template.html',
  directives: [coreDirectives, routerDirectives],
  providers: [ClassProvider(CourseService)],
  pipes: [commonPipes],
)
class SearchCourses implements OnInit {
  final CourseService _courseService;
  final Router _router;

  SearchCourses(this._courseService, this._router);

  Stream<List<Course>> courses;

  final StreamController<String> _searchCtrl =
      StreamController<String>.broadcast();

  void change(String term) => _searchCtrl.add(term);

  @override
  void ngOnInit() {
    this.courses = _searchCtrl.stream
        .transform(debounce(Duration(milliseconds: 300)))
        .distinct()
        .transform(switchMap((term) => term.isEmpty
            ? Stream<List<Course>>.fromIterable([<Course>[]])
            : this._courseService.search(term).asStream()))
        .handleError(this._courseService.simplifyError);
  }

  String _courseUrl(String uid) => RoutePaths.course_detail.toUrl(
        parameters: {idParam: uid},
      );

  Future<NavigationResult> toDetail(Course course) {
    this._router.navigate(_courseUrl(course.uid));
    this.courses = this.courses.skipWhile(
          (courses) => courses.length == 0,
        );
  }
}
