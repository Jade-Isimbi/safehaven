import 'package:flutter/foundation.dart';
import '../../data/services/coping_tool_service.dart';
import '../../data/models/coping_tool_model.dart';

class CopingToolProvider with ChangeNotifier {
  final CopingToolService _service = CopingToolService();
  
  List<CopingToolModel> _copingTools = [];
  CopingToolModel? _selectedTool;
  bool _isLoading = false;
  String? _error;

  // Getters
  List<CopingToolModel> get copingTools => _copingTools;
  CopingToolModel? get selectedTool => _selectedTool;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Load all coping tools
  Future<void> loadCopingTools() async {
    _setLoading(true);
    _clearError();
    
    try {
      _copingTools = await _service.getAllCopingTools();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load coping tools: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Load specific coping tool by ID
  Future<void> loadCopingToolById(String id) async {
    _setLoading(true);
    _clearError();
    
    try {
      _selectedTool = await _service.getCopingToolById(id);
      notifyListeners();
    } catch (e) {
      _setError('Failed to load coping tool: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Clear selected tool
  void clearSelectedTool() {
    _selectedTool = null;
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