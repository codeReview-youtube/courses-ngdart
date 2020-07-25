import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';

import '../components/courses/courses_component.template.dart'
    as courses_template;

import '../components/home/home_component.template.dart' as home_template;
import '../components/courses/course_detail_component.template.dart'
    as course_detail_template;

export 'route_paths.dart';

class Routes {
  static final courses = RouteDefinition(
    routePath: RoutePaths.courses,
    component: courses_template.CoursesComponentNgFactory,
  );
  static final home = RouteDefinition(
    routePath: RoutePaths.home,
    component: home_template.HomeComponentNgFactory,
  );
  static final course_detail = RouteDefinition(
    routePath: RoutePaths.course_detail,
    component: course_detail_template.CourseDetailNgFactory,
  );

  static final all = <RouteDefinition>[
    home,
    courses,
    course_detail,
    // RouteDefinition.redirect(
    //   path: '/',
    //   redirectTo: RoutePaths.courses.toUrl(),
    // ),
  ];
}
