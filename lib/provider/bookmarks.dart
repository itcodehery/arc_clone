import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookmarksProvider extends ChangeNotifier {
  List<String> _bookmarks = [];

  List<String> get bookmarks => _bookmarks;

  void addBookmark(String bookmark) {
    _bookmarks.add(bookmark);
    notifyListeners();
  }

  void removeBookmark(String bookmark) {
    _bookmarks.remove(bookmark);
    notifyListeners();
  }
}
