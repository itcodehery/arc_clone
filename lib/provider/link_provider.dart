import 'package:flutter/foundation.dart';

class LinkProvider with ChangeNotifier {
  String _currentLink = '';

  String get currentLink => _currentLink;

  void updateLink(String newLink) {
    _currentLink = newLink;
    notifyListeners();
  }
}
