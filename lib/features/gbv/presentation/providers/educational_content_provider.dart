import 'package:flutter/foundation.dart';
import '../../data/services/educational_content_service.dart';
import '../../data/models/educational_content_model.dart';

class EducationalContentProvider with ChangeNotifier {
  final EducationalContentService _service = EducationalContentService();
  
  List<EducationalContentModel> _educationalContent = [];
  EducationalContentModel? _selectedContent;
  bool _isLoading = false;
  String? _error;

  // Getters
  List<EducationalContentModel> get educationalContent => _educationalContent;
  EducationalContentModel? get selectedContent => _selectedContent;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Load all educational content
  Future<void> loadEducationalContent() async {
    _setLoading(true);
    _clearError();
    
    try {
      _educationalContent = await _service.getAllEducationalContent();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load educational content: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Load specific educational content by ID
  Future<void> loadEducationalContentById(String id) async {
    _setLoading(true);
    _clearError();
    
    try {
      _selectedContent = await _service.getEducationalContentById(id);
      notifyListeners();
    } catch (e) {
      _setError('Failed to load educational content: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Clear selected content
  void clearSelectedContent() {
    _selectedContent = null;
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