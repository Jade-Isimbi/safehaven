import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/coping_tool_model.dart';

class CopingToolService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'copingTools';

  // Get all documents from collection
  Future<List<CopingToolModel>> getAllCopingTools() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection(_collectionName)
          .get();

      return querySnapshot.docs.map((doc) {
        return CopingToolModel.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch coping tools: $e');
    }
  }

  // Get a specific document by ID
  Future<CopingToolModel?> getCopingToolById(String id) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection(_collectionName)
          .doc(id)
          .get();

      if (doc.exists) {
        return CopingToolModel.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch coping tool: $e');
    }
  }

  // Get real-time updates using Stream
  Stream<List<CopingToolModel>> getCopingToolsStream() {
    return _firestore
        .collection(_collectionName)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return CopingToolModel.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    });
  }
} 