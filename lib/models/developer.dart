class Developer {
  final String uid;
  final String name;
  final String imageURL;

  Developer({
    required this.uid,
    required this.name,
    required this.imageURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'imageURL': imageURL,
    };
  }

  factory Developer.fromDocument(docs) {
    return Developer(
      uid: docs.data()['uid'],
      name: docs.data()['name'],
      imageURL: docs.data()['imageURL'],
    );
  }

  factory Developer.fromMap(Map<String, dynamic> map) {
    return Developer(
      uid: map['uid'],
      name: map['name'],
      imageURL: map['imageURL'],
    );
  }
}
