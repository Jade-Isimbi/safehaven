import 'package:flutter/foundation.dart';
import '../../data/models/right_model.dart';
import '../../data/services/rights_service.dart';

class RightsProvider extends ChangeNotifier {
  final RightsService _rightsService = RightsService();
  
  List<RightModel> _rights = [];
  bool _isLoading = false;
  String? _error;

  List<RightModel> get rights => _rights;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadRights() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _rights = await _rightsService.getRights();
    } catch (e) {
      _error = 'Failed to load rights: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<RightModel?> getRightById(String id) async {
    try {
      return await _rightsService.getRightById(id);
    } catch (e) {
      _error = 'Failed to load right: $e';
      notifyListeners();
      return null;
    }
  }
} 