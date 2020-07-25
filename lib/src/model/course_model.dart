import 'package:angular_components/model/date/date_formatter.dart';
import 'package:intl/intl.dart';

class Course {
  final String uid;
  String title;
  String description;
  String image;
  List<dynamic> tags;
  String updateAt;
  List<dynamic> lectures;
  double duration;
  double price;
  String author;

  Course(
    this.uid,
    this.title,
    this.author,
    this.price, [
    this.description = '',
    this.duration = 0.0,
    this.image = 'https://tinyurl.com/yy2s9ntd',
    this.lectures = const [],
    this.tags = const [],
    this.updateAt,
  ]);

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        json['uid'],
        json['title'],
        json['author'],
        json['price'],
        json['description'],
        json['duration'],
        json['image'],
        json['lectures'],
        json['tags'],
        json['updateAt'],
      );

  @override
  String toString() {
    return '$uid => $title';
  }

  Map toJson() => {
        'uid': uid,
        'title': title,
        'author': author,
        'price': price,
        'description': description,
        'duration': duration,
        'image': image,
        'lectures': lectures,
        'tags': tags,
        'updateAt': updateAt,
      };
}
