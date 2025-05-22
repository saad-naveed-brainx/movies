class MovieModel {
  final String title;
  final String rating;
  final String id;
  final int year;
  final String image;

  MovieModel({
    required this.title,
    required this.rating,
    required this.id,
    required this.year,
    required this.image,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      rating: json['rating'],
      id: json['id'],
      year: json['year'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'rating': rating,
      'id': id,
      'year': year,
      'image': image,
    };
  }
}
