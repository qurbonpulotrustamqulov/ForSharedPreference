class ToDo {
  final int id;
  final String title;
  final String description;
  final String dateTime;

  const ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dateTime: json['dateTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime,
    };
  }

  @override
  String toString() {
    return 'ToDo{id: $id, title: $title, description: $description dateTime: $dateTime}';
  }

  @override
  int get hashCode => Object.hash(id, title, description, dateTime);

  @override
  bool operator ==(Object other) {
    return other is ToDo &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.dateTime == dateTime;
  }
}
