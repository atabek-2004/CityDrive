import 'package:flutter/foundation.dart';
import 'package:city_drive/src/feature/main/data/news_remote_ds.dart';
import 'package:city_drive/src/feature/main/model/news_dto.dart';

class NewsProvider extends ChangeNotifier {
  NewsProvider(this._remote) {
    load();
  }

  final NewsRemoteDS _remote;
  List<NewsDTO> _items = [];
  bool _loading = false;
  String? _loadError;

  List<NewsDTO> get items => _items;
  bool get isLoading => _loading;
  String? get loadError => _loadError;

  Future<void> load() async {
    _loading = true;
    _loadError = null;
    notifyListeners();
    try {
      _items = await _remote.fetchList();
    } catch (e) {
      _loadError = e.toString();
      debugPrint('NewsProvider.load error: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> refreshSilently() async {
    try {
      _items = await _remote.fetchList();
      notifyListeners();
    } catch (e) {
      debugPrint('NewsProvider.refreshSilently error: $e');
    }
  }
}
