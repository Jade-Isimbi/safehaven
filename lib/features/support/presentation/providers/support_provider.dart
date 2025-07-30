import 'package:flutter/foundation.dart';
import '../../data/models/support_model.dart';
import '../../data/services/support_service.dart';

class SupportProvider extends ChangeNotifier {
  final SupportService _service = SupportService();
  
  List<SupportModel> _supportItems = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<SupportModel> get supportItems => _supportItems;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Load all support items
  Future<void> loadSupportItems() async {
    _setLoading(true);
    _clearError();

    try {
      _supportItems = await _service.getAllSupportItems();
      _setLoading(false);
    } catch (e) {
      _setError(e.toString());
      _setLoading(false);
    }
  }

  // Get support item by ID
  Future<SupportModel?> getSupportItemById(String id) async {
    try {
      return await _service.getSupportItemById(id);
    } catch (e) {
      _setError(e.toString());
      return null;
    }
  }

  // Add new support item
  Future<void> addSupportItem(SupportModel item) async {
    try {
      await _service.addSupportItem(item);
      await loadSupportItems(); // Refresh the list
    } catch (e) {
      _setError(e.toString());
    }
  }

  // Update support item
  Future<void> updateSupportItem(String id, SupportModel item) async {
    try {
      await _service.updateSupportItem(id, item);
      await loadSupportItems(); // Refresh the list
    } catch (e) {
      _setError(e.toString());
    }
  }

  // Delete support item
  Future<void> deleteSupportItem(String id) async {
    try {
      await _service.deleteSupportItem(id);
      await loadSupportItems(); // Refresh the list
    } catch (e) {
      _setError(e.toString());
    }
  }

  // Get real-time updates stream
  Stream<List<SupportModel>> getSupportItemsStream() {
    return _service.getSupportItemsStream();
  }

  // Helper methods
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

  // Clear all data
  void clearData() {
    _supportItems = [];
    _error = null;
    _isLoading = false;
    notifyListeners();
  }
} 