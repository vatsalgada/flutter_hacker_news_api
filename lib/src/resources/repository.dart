import 'dart:async';
import './news_api_provider.dart';
import './news_db_provider.dart';
import '../models/items_model.dart';

class Repository{
  NewsApiProvider apiProvider = NewsApiProvider();
  NewsDbProvider dbProvider = NewsDbProvider();

  Future<List<int>> fetchTopIds(){
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItems(int id) async{
    var item = await dbProvider.fetchItem(id); 
    if (item!= null){
      return item;
    }else {

     item =  await apiProvider.fetchItem(id);
     dbProvider.addItem(item);
     
     return item;
    }
  }
}