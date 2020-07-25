import 'dart:async';

import 'package:angular/angular.dart';
import 'package:courses/src/directives/highlight_dir.dart';
import 'package:courses/src/model/course_model.dart';

@Component(
  selector: 'course-card',
  templateUrl: './card_template.html',
  directives: [
    coreDirectives,
    HighlightDirective,
  ],
  providers: [],
)
class CourseCard {
  @Input('selectedCourse')
  Course course;

  @Input('firstBtnTitle')
  String firstBtnTitle;

  final StreamController _deleteCtrl = StreamController();
  final StreamController _viewDetailCtrl = StreamController();

  @Output('onDelete')
  Stream get onDelete => _deleteCtrl.stream;

  @Output('onViewDetail')
  Stream get onViewDetail => _viewDetailCtrl.stream;

  void deleteItem() {
    _deleteCtrl.sink.add(null);
  }

  void viewDetail() {
    _viewDetailCtrl.sink.add(null);
  }
}
