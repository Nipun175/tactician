class Roadmap {
  Roadmap({
    required this.name,
    required this.rid,
});
  String name;
  String rid;


  factory Roadmap.fromJson(Map<String, dynamic> json) => Roadmap(
        name: json["name"],
        rid: json["rid"],
      );

  String? get imageUrl => null;

  Map<String, dynamic> toJson() => {
        "name": name,
        "rid": rid,
      };
}
