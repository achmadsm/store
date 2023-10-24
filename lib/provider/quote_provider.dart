import 'package:flutter/cupertino.dart';
import 'package:store/data/api/api_service.dart';
import 'package:store/data/model/quote.dart';
import 'package:store/utils/result_state.dart';

class QuoteProvider extends ChangeNotifier {
  final ApiService apiService;

  QuoteProvider(this.apiService) {
    _fetchQuotes();
  }

  late QuoteResult _result;
  late ResultState _state;

  String _message = '';

  QuoteResult get result => _result;

  ResultState get state => _state;

  String get message => _message;

  Future<dynamic> _fetchQuotes() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final quote = await apiService.quotes();

      if (quote.quotes.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _result = quote;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
