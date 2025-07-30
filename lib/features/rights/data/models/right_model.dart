class RightModel {
  final String id;
  final String title;
  final String content;
  final String description;
  final String region;
  final String? url; // New field for URL
  final bool hasUrl; // Flag to indicate if URL exists

  RightModel({
    required this.id,
    required this.title,
    required this.content,
    required this.description,
    required this.region,
    this.url,
    this.hasUrl = false,
  });

  factory RightModel.fromMap(String id, Map<String, dynamic> map) {
    final url = map['url'] as String?;
    return RightModel(
      id: id,
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      description: map['description'] ?? '',
      region: map['region'] ?? '',
      url: url,
      hasUrl: url != null && url.isNotEmpty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'description': description,
      'region': region,
      'url': url,
    };
  }
} 