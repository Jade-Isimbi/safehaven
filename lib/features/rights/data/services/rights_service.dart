import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/right_model.dart';

class RightsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<RightModel>> getRights() async {
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection('rightsContent')
          .get();

      return snapshot.docs.map((doc) {
        return RightModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      // Error fetching rights: $e
      return [];
    }
  }

  Future<RightModel?> getRightById(String id) async {
    try {
      final DocumentSnapshot doc = await _firestore
          .collection('rightsContent')
          .doc(id)
          .get();

      if (doc.exists) {
        return RightModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      // Error fetching right by ID: $e
      return null;
    }
  }
} 