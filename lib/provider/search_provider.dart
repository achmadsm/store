import 'package:flutter/foundation.dart';
import 'package:store/data/api/api_service.dart';
import 'package:store/data/model/product.dart';
import 'package:store/utils/result_state.dart';

class SearchProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchProvider(this.apiService);

  late ProductResult _result;
  ResultState _state = ResultState.noData;

  String _message = '';
  String _query = '';

  ProductResult get result => _result;

  ResultState get state => _state;

  String get message => _message;

  String get query => _query;

  Future<dynamic> fetchSearch(String query) async {
    try {
      _state = ResultState.loading;
      _query = query;
      notifyListeners();

      final product = await apiService.searchProduct(query);

      if (product.products.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'No Data is found';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _result = product;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
