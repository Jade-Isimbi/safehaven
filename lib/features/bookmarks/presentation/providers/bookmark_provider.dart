import 'package:flutter/foundation.dart';
import '../../data/services/bookmark_service.dart';
import '../../data/models/bookmark_model.dart';

class BookmarkProvider with ChangeNotifier {
  final BookmarkService _service = BookmarkService();
  
  List<BookmarkModel> _bookmarks = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<BookmarkModel> get bookmarks => _bookmarks;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Load user's bookmarks
  Future<void> loadUserBookmarks() async {
    _setLoading(true);
    _clearError();
    
    try {
      _bookmarks = await _service.getUserBookmarks();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load bookmarks: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Add a bookmark
  Future<void> addBookmark({
    required String itemId,
    required String title,
    required String description,
    required String type,
  }) async {
    _clearError();
    
    try {
      await _service.addBookmark(
        itemId: itemId,
        title: title,
        description: description,
        type: type,
      );
      
      // Reload bookmarks to get updated list
      await loadUserBookmarks();
    } catch (e) {
      _setError('Failed to add bookmark: $e');
    }
  }

  // Remove a bookmark
  Future<void> removeBookmark({
    required String itemId,
    required String type,
  }) async {
    _clearError();
    
    try {
      await _service.removeBookmark(
        itemId: itemId,
        type: type,
      );
      
      // Reload bookmarks to get updated list
      await loadUserBookmarks();
    } catch (e) {
      _setError('Failed to remove bookmark: $e');
    }
  }

  // Toggle bookmark (add if not bookmarked, remove if bookmarked)
  Future<void> toggleBookmark({
    required String itemId,
    required String title,
    required String description,
    required String type,
  }) async {
    try {
      bool isBookmarked = await _service.isBookmarked(
        itemId: itemId,
        type: type,
      );

      if (isBookmarked) {
        await removeBookmark(itemId: itemId, type: type);
      } else {
        await addBookmark(
          itemId: itemId,
          title: title,
          description: description,
          type: type,
        );
      }
    } catch (e) {
      _setError('Failed to toggle bookmark: $e');
    }
  }

  // Check if item is bookmarked
  Future<bool> isBookmarked({
    required String itemId,
    required String type,
  }) async {
    try {
      return await _service.isBookmarked(itemId: itemId, type: type);
    } catch (e) {
      return false;
    }
  }

  // Clear bookmarks
  void clearBookmarks() {
    _bookmarks = [];
    notifyListeners();
  }

  // Private methods for state management
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
  }
} 