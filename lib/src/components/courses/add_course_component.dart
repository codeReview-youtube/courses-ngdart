import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'add-course',
  templateUrl: './add_course_template.html',
  directives: [
    coreDirectives,
    routerDirectives,
    formDirectives,
  ],
  providers: [
    // ClassProvider(YourService)
  ],
)
class AddCourse {
  bool addMode = false;
  String title = '';
  String author = '';
  double price = 0.0;

  StreamController<Map<String, dynamic>> _addcourseCtrl =
      StreamController<Map<String, dynamic>>();

  @Output('onAdd')
  Stream get onAddCourse => _addcourseCtrl.stream;

  void addCourse() {
    if (title.isNotEmpty && author.isNotEmpty) {
      _addcourseCtrl.sink.add({
        'title': title,
        'author': author,
        'price': price,
      });
    } else {
      return;
    }
    addMode = false;
  }
}
