import 'package:flutter/foundation.dart';
import 'package:store/data/db/auth_repository.dart';
import 'package:store/utils/result_state.dart';

class ProfileProvider extends ChangeNotifier {
  final AuthRepository authRepository;

  ProfileProvider(this.authRepository) {
    _profile();
  }

  String _name = '';

  String _image = '';

  late ResultState _state;

  String get name => _name;

  String get image => _image;

  ResultState get state => _state;

  Future<void> _profile() async {
    _state = ResultState.loading;
    notifyListeners();

    String? firstName = await authRepository.getFirstName();
    String? lastName = await authRepository.getLastName();
    String? image = await authRepository.getImage();

    if (firstName != null && lastName != null) {
      _name = '$firstName $lastName';
    }

    if (image != null) {
      _image = image;
    }

    _state = ResultState.hasData;
    notifyListeners();
  }
}
