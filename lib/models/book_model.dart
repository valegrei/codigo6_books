class BookModel {
  int? id;
  String title;
  String author;
  String description;
  String image;

  BookModel({
    this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        //"id": id,
        "title": title,
        "author": author,
        "description": description,
        "image": image,
      };

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        image: json["image"],
      );
}
