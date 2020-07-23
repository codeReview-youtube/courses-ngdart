class Course {
  final String uid;
  String title;
  String description;
  String image;
  List<String> tags;
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
    this.description,
    this.duration,
    this.image,
    this.lectures,
    this.tags,
    this.updateAt,
  ]);
}
