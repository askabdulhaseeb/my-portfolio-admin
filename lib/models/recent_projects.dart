import 'dart:convert';

class RecentProjects {
  final String title;
  final String description;
  final List<String> developers;
  final List<String> projectType;
  final String thumnailURL;
  final List<String> projectURL;
  final List<String> photosURL;

  RecentProjects({
    required this.title,
    required this.description,
    required this.developers,
    required this.projectType,
    required this.thumnailURL,
    required this.projectURL,
    required this.photosURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'developers': developers,
      'project_type': projectType,
      'thumnailURL': thumnailURL,
      'projectURL': projectURL,
      'photosURL': photosURL,
    };
  }

  factory RecentProjects.fromMap(Map<String, dynamic> map) {
    return RecentProjects(
      title: map['title'],
      description: map['description'],
      developers: List<String>.from(map['developers']),
      projectType: List<String>.from(map['project_type']),
      thumnailURL: map['thumnailURL'],
      projectURL: List<String>.from(map['projectURL']),
      photosURL: List<String>.from(map['photosURL']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecentProjects.fromJson(String source) =>
      RecentProjects.fromMap(json.decode(source));
}
