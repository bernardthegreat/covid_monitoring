import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  String _authName;

  get authName {
    return _authName;
  }

  void setName({@required String name}){
    _authName = name;
    print(authName);
    notifyListeners();
  }
}
