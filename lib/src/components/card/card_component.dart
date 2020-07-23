import 'dart:async';

import 'package:angular/angular.dart';
import 'package:courses/src/model/course_model.dart';

@Component(
  selector: 'course-card',
  templateUrl: './card_template.html',
  directives: [coreDirectives],
  providers: [],
)
class CourseCard {
  @Input('selectedCourse')
  Course course;

  final StreamController _deleteCtrl = StreamController();

  @Output('onDelete')
  Stream get onDelete => _deleteCtrl.stream;

  void deleteItem() {
    _deleteCtrl.sink.add(null);
  }
}
