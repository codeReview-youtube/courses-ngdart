import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:courses/src/utils/routes.dart';

@Component(
  selector: 'app-header',
  templateUrl: './header_template.html',
  directives: [routerDirectives, coreDirectives],
  providers: [],
  exports: [RoutePaths],
)
class AppHeader {}
