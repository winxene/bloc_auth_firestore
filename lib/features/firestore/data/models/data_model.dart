class DataModel {
  final String name;
  final String author;
  final Map<String, double> score;

  DataModel({required this.name, required this.author, required this.score});

  // Convert a DataModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'author': author,
      'score': score,
    };
  }

  // Convert a Map to a DataModel
  static DataModel fromMap(Map<String, dynamic> map) {
    return DataModel(
      name: map['name'],
      author: map['author'],
      score: Map<String, double>.from(map['score']),
    );
  }
}
