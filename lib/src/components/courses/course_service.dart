import 'package:angular/angular.dart';
import 'package:courses/src/model/course_model.dart';
import 'package:courses/src/services/client_service.dart';
import 'package:http/src/client.dart';

@Injectable()
class CourseService extends ClientService {
  final List<Course> _enrollCourses = [];

  CourseService(Client client) : super(client);

  void enroll(Course course) {
    this._enrollCourses.add(course);
  }
}
