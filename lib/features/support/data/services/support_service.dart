import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/support_model.dart';

class SupportService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'supportDirectory';

  // Get all documents from collection
  Future<List<SupportModel>> getAllSupportItems() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection(_collectionName)
          .get();

      return querySnapshot.docs.map((doc) {
        return SupportModel.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch support data: $e');
    }
  }

  // Get a specific document by ID
  Future<SupportModel?> getSupportItemById(String id) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection(_collectionName)
          .doc(id)
          .get();

      if (doc.exists) {
        return SupportModel.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch support item: $e');
    }
  }

  // Add a new document
  Future<void> addSupportItem(SupportModel item) async {
    try {
      await _firestore
          .collection(_collectionName)
          .add(item.toMap());
    } catch (e) {
      throw Exception('Failed to add support item: $e');
    }
  }

  // Update an existing document
  Future<void> updateSupportItem(String id, SupportModel item) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(id)
          .update(item.toMap());
    } catch (e) {
      throw Exception('Failed to update support item: $e');
    }
  }

  // Delete a document
  Future<void> deleteSupportItem(String id) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(id)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete support item: $e');
    }
  }

  // Get real-time updates using Stream
  Stream<List<SupportModel>> getSupportItemsStream() {
    return _firestore
        .collection(_collectionName)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return SupportModel.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    });
  }
} 