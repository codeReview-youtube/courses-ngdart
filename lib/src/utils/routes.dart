import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';

import '../components/courses/courses_component.template.dart'
    as courses_template;

import '../components/home/home_component.template.dart' as home_template;

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

  static final all = <RouteDefinition>[
    home,
    courses,
    // RouteDefinition.redirect(
    //   path: '/',
    //   redirectTo: RoutePaths.courses.toUrl(),
    // ),
  ];
}
