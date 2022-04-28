class Topic {
  String? id;
  String? name;
  String? color;
  String? image;

  Topic({this.id, this.name, this.color, this.image});

  factory Topic.fromMap(map) {
    return Topic(
        id: map['id'],
        name: map['name'],
        color: map['color'],
        image: map['image']);
  }
}
