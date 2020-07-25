import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:courses/src/model/course_model.dart';
import 'package:courses/src/services/helper_service.dart';
import 'package:http/http.dart';

@Injectable()
class ClientService extends HelperService {
  final Client _client;
  static const _base = 'api/courses';
  static final _headers = {'Content-Type': 'application/json'};

  ClientService(this._client);

  // get all
  Future<List<Course>> getAll() async {
    try {
      final res = await _client.get(_base, headers: _headers);
      return (extractData(res) as List)
          .map((json) => Course.fromJson(json))
          .toList();
    } catch (e) {
      throw simplifyError(e);
    }
  }

  // get single
  Future<Course> getSingle(String uid) async {
    try {
      final res = await _client.get('$_base/$uid');
      return Course.fromJson(extractData(res));
    } catch (e) {
      throw simplifyError(e);
    }
  }

  Future<Course> createCourse(
    String title,
    String author,
    double price,
  ) async {
    try {
      final res = await _client.post(
        _base,
        headers: _headers,
        body: json.encode({
          'title': title,
          'author': author,
          'price': price,
        }),
      );

      return Course.fromJson(extractData(res));
    } catch (e) {
      throw simplifyError(e);
    }
  }

  // delete
  Future<Response> deleteCourse(String uid) async {
    try {
      final url = '$_base/$uid';
      return await _client.delete(url, headers: _headers);
    } catch (e) {
      throw simplifyError(e);
    }
  }

  Future<Course> updateCourse(Course course) async {
    try {
      final url = '$_base/${course.uid}';
      final res = await _client.put(
        url,
        headers: _headers,
        body: json.encode(course),
      );
      return Course.fromJson(extractData(res));
    } catch (e) {
      throw simplifyError(e);
    }
  }
}
