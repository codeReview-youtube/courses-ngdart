import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:courses/src/components/footer/footer_component.dart';

import 'package:courses/src/components/header/header_component.dart';
import 'package:courses/src/utils/routes.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: [routerDirectives, AppHeader, FooterComponent],
    exports: [RoutePaths, Routes])
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
