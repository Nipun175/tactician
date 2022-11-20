import 'dart:convert';

List<Timeline> notesFromJson(String str) =>
    List<Timeline>.from(json.decode(str).map((x) => Timeline.fromJson(x)));

String notesToJson(List<Timeline> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Timeline {
  Timeline({
    required this.rid,
    required this.title,
    required this.description,
    required this.image,
  });
  String rid;
  String title;
  String description;
  String image;

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        rid: json["rid"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
      );

  String? get imageUrl => null;

  Map<String, dynamic> toJson() => {
        "rid": rid,
        "title": title,
        "description": description,
        "image": image,
      };
}
