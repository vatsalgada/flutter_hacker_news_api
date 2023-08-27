// ignore_for_file: unused_local_variable
import '../models/items_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class NewsApiProvider {
  Client client = Client();
  fetchTopIds() async {
    final response = await client
        .get("https://hacker-news.firebaseio.com/v0/topstories.json" as Uri);
    final ids = json.decode(response.body);

    return ids;
  }

  fetchItem(int id) async {
    final response = await client
        .get('https://hacker-news.firebaseio.com/v0/item/$id.json' as Uri);
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}