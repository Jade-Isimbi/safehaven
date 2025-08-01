import 'package:flutter/foundation.dart';

class RatingProvider with ChangeNotifier {
  double _rating = 0.0;
  String _comment = '';
  bool _isLoading = false;
  String? _error;
  bool _isSubmitted = false;

  // Getters
  double get rating => _rating;
  String get comment => _comment;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isSubmitted => _isSubmitted;

  // Set rating
  void setRating(double rating) {
    _rating = rating;
    notifyListeners();
  }

  // Set comment
  void setComment(String comment) {
    _comment = comment;
    notifyListeners();
  }

  // Submit rating
  Future<void> submitRating() async {
    _setLoading(true);
    _clearError();
    
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      _isSubmitted = true;
      notifyListeners();
    } catch (e) {
      _setError('Failed to submit rating: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Reset form
  void resetForm() {
    _rating = 0.0;
    _comment = '';
    _isSubmitted = false;
    _clearError();
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