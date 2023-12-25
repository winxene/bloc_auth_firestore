class DataModel {
  final String id;
  final String name;
  final String author;
  final Map<String, double> score;

  DataModel(
      {required this.id,
      required this.name,
      required this.author,
      required this.score});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'author': author,
      'score': score,
    };
  }

  static DataModel fromMap(String id, Map<String, dynamic> map) {
    return DataModel(
      id: id,
      name: map['name'],
      author: map['author'],
      score: Map<String, double>.from(map['score']),
    );
  }
}
