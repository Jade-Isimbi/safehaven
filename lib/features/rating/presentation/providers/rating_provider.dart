import 'package:flutter/foundation.dart';
import '../../data/models/rating_model.dart';
import '../../data/services/rating_service.dart';

class RatingProvider extends ChangeNotifier {
  final RatingService _service = RatingService();
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> submitRating(RatingModel rating) async {
    _setLoading(true);
    _clearError();
    try {
      await _service.addRating(rating);
    } catch (e) {
      _setError(e.toString());
    }
    _setLoading(false);
  }

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
    notifyListeners();
  }
}