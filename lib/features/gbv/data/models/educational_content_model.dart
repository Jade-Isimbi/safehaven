class EducationalContentModel {
  final String id;
  final String title;
  final String description;
  final String content;
  final String language;

  EducationalContentModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.language,
  });

  factory EducationalContentModel.fromMap(String id, Map<String, dynamic> map) {
    return EducationalContentModel(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      content: map['content'] ?? '',
      language: map['language'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'content': content,
      'language': language,
    };
  }

  @override
  String toString() {
    return 'EducationalContentModel(id: $id, title: $title, description: $description, content: $content, language: $language)';
  }
} 