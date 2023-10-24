import 'package:flutter/cupertino.dart';
import 'package:store/data/api/api_service.dart';
import 'package:store/data/model/product.dart';
import 'package:store/utils/result_state.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService apiService;

  ProductProvider(this.apiService) {
    _fetchProducts();
  }

  late ProductResult _result;
  late ResultState _state;

  String _message = '';

  ProductResult get result => _result;

  ResultState get state => _state;

  String get message => _message;

  Future<dynamic> _fetchProducts() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final product = await apiService.products();

      if (product.products.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
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
