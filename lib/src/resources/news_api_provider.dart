// ignore_for_file: unused_local_variable
import '../models/items_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'repository.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  Client client = Client();
  @override
  Future<List<int>> fetchTopIds() async {
    print('cursor at tile top stories');
    final response = await client.get(Uri.parse('$_root/topstories.json'));
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    print('cursor at tile details');
    final response = await client
        .get('https://hacker-news.firebaseio.com/v0/item/$id.json' as Uri);
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
