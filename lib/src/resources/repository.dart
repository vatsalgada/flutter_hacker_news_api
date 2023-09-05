import 'dart:async';
import './news_api_provider.dart';
import './news_db_provider.dart';
import '../models/items_model.dart';

class Repository{
  List<Source> sources = <Source>[
    NewsApiProvider(),
    newsDbProvider,
  ];

List<Cache> caches = <Cache>[
  newsDbProvider
];

  // NewsApiProvider apiProvider = NewsApiProvider();
  // NewsDbProvider dbProvider = NewsDbProvider();

  Future<List<int>>? fetchTopIds(){
    return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItems(int id) async{
   var item;
   var source;

    for (source in sources) {
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

    //   var item = await dbProvider.fetchItem(id); 
  //   if (item!= null){
  //     return item;
  //   }else {

  //    item =  await apiProvider.fetchItem(id);
  //    dbProvider.addItem(item);
     
  //    return item;
  //   }
  // }
}
}

abstract class Source{
  Future<List<int>>?fetchTopIds();
  Future<ItemModel?>fetchItem(int ID);
}

abstract class Cache{
  Future<int> addItem(ItemModel item);
}