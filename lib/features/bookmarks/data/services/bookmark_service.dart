import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/bookmark_model.dart';

class BookmarkService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String _collectionName = 'bookmarks';

  // Get current user ID
  String? get _currentUserId => _auth.currentUser?.uid;

  // Get user's bookmarks
  Future<List<BookmarkModel>> getUserBookmarks() async {
    try {
      if (_currentUserId == null) {
        throw Exception('User not authenticated');
      }

      QuerySnapshot querySnapshot = await _firestore
          .collection(_collectionName)
          .where('userId', isEqualTo: _currentUserId)
          .orderBy('createdAt', descending: true)
          .get();

      return querySnapshot.docs.map((doc) {
        return BookmarkModel.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch bookmarks: $e');
    }
  }

  // Add a bookmark
  Future<void> addBookmark({
    required String itemId,
    required String title,
    required String description,
    required String type,
  }) async {
    try {
      if (_currentUserId == null) {
        throw Exception('User not authenticated');
      }

      // Check if bookmark already exists
      QuerySnapshot existingBookmark = await _firestore
          .collection(_collectionName)
          .where('userId', isEqualTo: _currentUserId)
          .where('itemId', isEqualTo: itemId)
          .where('type', isEqualTo: type)
          .get();

      if (existingBookmark.docs.isNotEmpty) {
        throw Exception('Bookmark already exists');
      }

      await _firestore.collection(_collectionName).add({
        'userId': _currentUserId,
        'itemId': itemId,
        'title': title,
        'description': description,
        'type': type,
        'createdAt': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Failed to add bookmark: $e');
    }
  }

  // Remove a bookmark
  Future<void> removeBookmark({
    required String itemId,
    required String type,
  }) async {
    try {
      if (_currentUserId == null) {
        throw Exception('User not authenticated');
      }

      QuerySnapshot bookmarkQuery = await _firestore
          .collection(_collectionName)
          .where('userId', isEqualTo: _currentUserId)
          .where('itemId', isEqualTo: itemId)
          .where('type', isEqualTo: type)
          .get();

      if (bookmarkQuery.docs.isNotEmpty) {
        await bookmarkQuery.docs.first.reference.delete();
      }
    } catch (e) {
      throw Exception('Failed to remove bookmark: $e');
    }
  }

  // Check if item is bookmarked
  Future<bool> isBookmarked({
    required String itemId,
    required String type,
  }) async {
    try {
      if (_currentUserId == null) {
        return false;
      }

      QuerySnapshot bookmarkQuery = await _firestore
          .collection(_collectionName)
          .where('userId', isEqualTo: _currentUserId)
          .where('itemId', isEqualTo: itemId)
          .where('type', isEqualTo: type)
          .get();

      return bookmarkQuery.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  // Get real-time updates using Stream
  Stream<List<BookmarkModel>> getUserBookmarksStream() {
    if (_currentUserId == null) {
      return Stream.value([]);
    }

    return _firestore
        .collection(_collectionName)
        .where('userId', isEqualTo: _currentUserId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return BookmarkModel.fromMap(
          doc.id,
          doc.data() as Map<String, dynamic>,
        );
      }).toList();
    });
  }
} 