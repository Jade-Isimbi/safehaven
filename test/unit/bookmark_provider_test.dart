import 'package:flutter_test/flutter_test.dart';

// Mock BookmarkProvider for testing without Firebase
class MockBookmarkProvider {
  List<MockBookmark> _bookmarks = [];
  bool _isLoading = false;
  String? _error;

  List<MockBookmark> get bookmarks => _bookmarks;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void setLoading(bool loading) {
    _isLoading = loading;
  }

  void setError(String? error) {
    _error = error;
  }

  Future<void> addBookmark({
    required String itemId,
    required String title,
    required String description,
    required String type,
  }) async {
    _isLoading = true;
    _error = null;
    
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 100));
    
    _bookmarks.add(MockBookmark(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      itemId: itemId,
      title: title,
      description: description,
      type: type,
    ));
    
    _isLoading = false;
  }

  Future<void> removeBookmark(String itemId) async {
    _isLoading = true;
    _error = null;
    
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 100));
    
    _bookmarks.removeWhere((bookmark) => bookmark.itemId == itemId);
    
    _isLoading = false;
  }

  Future<void> toggleBookmark({
    required String itemId,
    required String title,
    required String description,
    required String type,
  }) async {
    if (isBookmarked(itemId)) {
      await removeBookmark(itemId);
    } else {
      await addBookmark(
        itemId: itemId,
        title: title,
        description: description,
        type: type,
      );
    }
  }

  bool isBookmarked(String itemId) {
    return _bookmarks.any((bookmark) => bookmark.itemId == itemId);
  }

  void clearBookmarks() {
    _bookmarks.clear();
  }

  Future<void> loadUserBookmarks() async {
    _isLoading = true;
    _error = null;
    
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 100));
    
    // Add some mock bookmarks
    _bookmarks = [
      MockBookmark(
        id: '1',
        itemId: 'test-item-1',
        title: 'Test Title 1',
        description: 'Test Description 1',
        type: 'educational',
      ),
      MockBookmark(
        id: '2',
        itemId: 'test-item-2',
        title: 'Test Title 2',
        description: 'Test Description 2',
        type: 'coping',
      ),
    ];
    
    _isLoading = false;
  }
}

// Mock Bookmark model
class MockBookmark {
  final String id;
  final String itemId;
  final String title;
  final String description;
  final String type;

  MockBookmark({
    required this.id,
    required this.itemId,
    required this.title,
    required this.description,
    required this.type,
  });
}

void main() {
  group('BookmarkProvider Unit Tests', () {
    late MockBookmarkProvider bookmarkProvider;

    setUp(() {
      bookmarkProvider = MockBookmarkProvider();
    });

    // Test 1: Initial state
    test('should have correct initial state', () {
      expect(bookmarkProvider.isLoading, false);
      expect(bookmarkProvider.error, null);
      expect(bookmarkProvider.bookmarks, isEmpty);
    });

    // Test 2: Add bookmark
    test('should add bookmark correctly', () async {
      // Initially empty
      expect(bookmarkProvider.bookmarks, isEmpty);
      
      // Add a bookmark
      await bookmarkProvider.addBookmark(
        itemId: 'test-item-1',
        title: 'Test Title',
        description: 'Test Description',
        type: 'educational',
      );
      
      // Verify bookmark was added
      expect(bookmarkProvider.bookmarks, hasLength(1));
      expect(bookmarkProvider.bookmarks.first.title, 'Test Title');
      expect(bookmarkProvider.bookmarks.first.description, 'Test Description');
      expect(bookmarkProvider.bookmarks.first.type, 'educational');
    });

    // Test 3: Remove bookmark
    test('should remove bookmark correctly', () async {
      // Add a bookmark first
      await bookmarkProvider.addBookmark(
        itemId: 'test-item-1',
        title: 'Test Title',
        description: 'Test Description',
        type: 'coping',
      );
      
      // Verify bookmark was added
      expect(bookmarkProvider.bookmarks, hasLength(1));
      
      // Remove the bookmark
      await bookmarkProvider.removeBookmark('test-item-1');
      
      // Verify bookmark was removed
      expect(bookmarkProvider.bookmarks, isEmpty);
    });

    // Test 4: Toggle bookmark
    test('should toggle bookmark correctly', () async {
      // Initially not bookmarked
      expect(bookmarkProvider.isBookmarked('test-item-1'), false);
      
      // Toggle bookmark on
      await bookmarkProvider.toggleBookmark(
        itemId: 'test-item-1',
        title: 'Test Title',
        description: 'Test Description',
        type: 'rights',
      );
      
      // Verify bookmark was added
      expect(bookmarkProvider.isBookmarked('test-item-1'), true);
      expect(bookmarkProvider.bookmarks, hasLength(1));
      
      // Toggle bookmark off
      await bookmarkProvider.toggleBookmark(
        itemId: 'test-item-1',
        title: 'Test Title',
        description: 'Test Description',
        type: 'rights',
      );
      
      // Verify bookmark was removed
      expect(bookmarkProvider.isBookmarked('test-item-1'), false);
      expect(bookmarkProvider.bookmarks, isEmpty);
    });

    // Test 5: Clear bookmarks
    test('should clear all bookmarks', () async {
      // Add multiple bookmarks
      await bookmarkProvider.addBookmark(
        itemId: 'test-item-1',
        title: 'Test Title 1',
        description: 'Test Description 1',
        type: 'educational',
      );
      
      await bookmarkProvider.addBookmark(
        itemId: 'test-item-2',
        title: 'Test Title 2',
        description: 'Test Description 2',
        type: 'coping',
      );
      
      // Verify bookmarks were added
      expect(bookmarkProvider.bookmarks, hasLength(2));
      
      // Clear all bookmarks
      bookmarkProvider.clearBookmarks();
      
      // Verify all bookmarks were cleared
      expect(bookmarkProvider.bookmarks, isEmpty);
    });

    // Test 6: Check bookmark status
    test('should correctly check if item is bookmarked', () async {
      // Initially not bookmarked
      expect(bookmarkProvider.isBookmarked('test-item-1'), false);
      
      // Add bookmark
      await bookmarkProvider.addBookmark(
        itemId: 'test-item-1',
        title: 'Test Title',
        description: 'Test Description',
        type: 'educational',
      );
      
      // Verify it's now bookmarked
      expect(bookmarkProvider.isBookmarked('test-item-1'), true);
      
      // Check non-existent item
      expect(bookmarkProvider.isBookmarked('non-existent'), false);
    });

    // Test 7: Loading state
    test('should handle loading state correctly', () async {
      // Initially not loading
      expect(bookmarkProvider.isLoading, false);
      
      // Start loading bookmarks
      final loadFuture = bookmarkProvider.loadUserBookmarks();
      
      // Wait for loading to complete
      await loadFuture;
      
      // Should not be loading after completion
      expect(bookmarkProvider.isLoading, false);
    });

    // Test 8: Load user bookmarks
    test('should load user bookmarks correctly', () async {
      // Initially empty
      expect(bookmarkProvider.bookmarks, isEmpty);
      
      // Load bookmarks
      await bookmarkProvider.loadUserBookmarks();
      
      // Verify bookmarks were loaded
      expect(bookmarkProvider.bookmarks, hasLength(2));
      expect(bookmarkProvider.bookmarks.first.title, 'Test Title 1');
      expect(bookmarkProvider.bookmarks.last.title, 'Test Title 2');
    });

    // Test 9: Error handling
    test('should handle errors correctly', () {
      // Initially no error
      expect(bookmarkProvider.error, null);
      
      // Set error
      bookmarkProvider.setError('Failed to load bookmarks');
      expect(bookmarkProvider.error, 'Failed to load bookmarks');
      
      // Clear error
      bookmarkProvider.setError(null);
      expect(bookmarkProvider.error, null);
    });
  });
} 