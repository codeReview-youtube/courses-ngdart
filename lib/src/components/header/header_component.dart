import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:courses/src/components/search/search_component.dart';
import 'package:courses/src/utils/routes.dart';

@Component(
  selector: 'app-header',
  templateUrl: './header_template.html',
  directives: [
    routerDirectives,
    coreDirectives,
    SearchCourses,
  ],
  providers: [],
  exports: [RoutePaths],
)
class AppHeader {}
