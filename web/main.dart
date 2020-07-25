import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
// ignore: library_prefixes
import 'package:courses/app_component.template.dart' as App;
import 'package:courses/src/utils/in-memory-data.service.dart';
import 'package:http/http.dart';

import 'main.template.dart' as self;

@GenerateInjector(
  [
    routerProvidersHash,
    // ClassProvider(Client, useClass: BrowserClient),
    ClassProvider(Client, useClass: InMemoryData),
  ],
)
final InjectorFactory injector = self.injector$Injector;
void main() {
  runApp(
    App.AppComponentNgFactory,
    createInjector: injector,
  );
}
