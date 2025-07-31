import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/rating_model.dart';

class RatingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'ratings';

  Future<void> addRating(RatingModel rating) async {
    await _firestore.collection(_collectionName).add(rating.toMap());
  }

  Future<List<RatingModel>> getAllRatings() async {
    final snapshot = await _firestore.collection(_collectionName).get();
    return snapshot.docs.map((doc) => RatingModel.fromMap(doc.data(), doc.id)).toList();
  }
}