class MovieModel {
  final String title;
  final String rating;
  final String id;
  final int year;

  MovieModel({
    required this.title,
    required this.rating,
    required this.id,
    required this.year,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      rating: json['rating'],
      id: json['id'],
      year: json['year'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'title': title, 'rating': rating, 'id': id, 'year': year};
  }
}
