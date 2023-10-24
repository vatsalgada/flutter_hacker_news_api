import 'dart:async';
import './news_api_provider.dart';
import './news_db_provider.dart';
import '../models/items_model.dart';

class Repository {
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider(),
  ];

  List<Cache> caches = <Cache>[newsDbProvider];

  // NewsApiProvider apiProvider = NewsApiProvider();
  // NewsDbProvider dbProvider = NewsDbProvider();

  Future<List<int>>? fetchTopIds() {
    print('searching in ids..');
    return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    print('searching..');
    var item;
    var source;

    for (source in sources) {
      print(source);
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }

    for (var cache in caches) {
      if (cache != source) {
        cache.addItem(item);
      }
    }
    return item;
  }
}

abstract class Source {
  Future<List<int>>? fetchTopIds();
  Future<ItemModel?> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
}
