class BookModel {
  String title;
  String author;
  String description;
  String image;

  BookModel({
    required this.title,
    required this.author,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
    "title": title,
    "author": author,
    "description": description,
    "image": image,
  };
}
