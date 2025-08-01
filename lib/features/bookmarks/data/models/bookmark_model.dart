import 'package:cloud_firestore/cloud_firestore.dart';

enum BookmarkType {
  educationalContent,
  copingTool,
  support,
  rights,
}

class BookmarkModel {
  final String id;
  final String itemId;
  final String title;
  final String description;
  final String type;
  final DateTime createdAt;

  BookmarkModel({
    required this.id,
    required this.itemId,
    required this.title,
    required this.description,
    required this.type,
    required this.createdAt,
  });

  factory BookmarkModel.fromMap(String id, Map<String, dynamic> map) {
    return BookmarkModel(
      id: id,
      itemId: map['itemId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      type: map['type'] ?? '',
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      'title': title,
      'description': description,
      'type': type,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  BookmarkType get bookmarkType {
    switch (type) {
      case 'educationalContent':
        return BookmarkType.educationalContent;
      case 'copingTool':
        return BookmarkType.copingTool;
      case 'support':
        return BookmarkType.support;
      case 'rights':
        return BookmarkType.rights;
      default:
        return BookmarkType.educationalContent;
    }
  }

  @override
  String toString() {
    return 'BookmarkModel(id: $id, itemId: $itemId, title: $title, type: $type)';
  }
} 