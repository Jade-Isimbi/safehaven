import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/educational_content_model.dart';

class EducationalContentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'educationalContent';

  // Get all documents from collection
  Future<List<EducationalContentModel>> getAllEducationalContent() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection(_collectionName)
          .get();

      return querySnapshot.docs.map((doc) {
        return EducationalContentModel.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch educational content: $e');
    }
  }

  // Get a specific document by ID
  Future<EducationalContentModel?> getEducationalContentById(String id) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection(_collectionName)
          .doc(id)
          .get();

      if (doc.exists) {
        return EducationalContentModel.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch educational content: $e');
    }
  }

  // Get real-time updates using Stream
  Stream<List<EducationalContentModel>> getEducationalContentStream() {
    return _firestore
        .collection(_collectionName)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return EducationalContentModel.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    });
  }
} 