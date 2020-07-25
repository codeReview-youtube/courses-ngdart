import 'package:angular_router/angular_router.dart';

String idParam = 'id';

class RoutePaths {
  static final courses = RoutePath(path: 'crouses');
  static final home = RoutePath(path: '/');
  static final course_detail = RoutePath(path: '${courses.path}/:${idParam}');
}

// ignore: unnecessary_null_in_if_null_operators
String getId(Map<String, String> params) => params[idParam];
