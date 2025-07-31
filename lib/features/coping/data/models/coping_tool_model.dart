class CopingToolModel {
  final String id;
  final String title;
  final String description;
  final String content;
  final String language;
  final String type;

  CopingToolModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.language,
    required this.type,
  });

  factory CopingToolModel.fromMap(String id, Map<String, dynamic> map) {
    return CopingToolModel(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      content: map['content'] ?? '',
      language: map['language'] ?? '',
      type: map['type'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'content': content,
      'language': language,
      'type': type,
    };
  }

  @override
  String toString() {
    return 'CopingToolModel(id: $id, title: $title, description: $description, content: $content, language: $language, type: $type)';
  }
} 