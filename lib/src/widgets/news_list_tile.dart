import 'package:flutter/material.dart';
import 'package:flutter_hacker_news_api/src/blocs/stories_bloc.dart';
import 'package:flutter_hacker_news_api/src/blocs/stories_provider.dart';
import 'package:flutter_hacker_news_api/src/models/items_model.dart';

class NewsListTile extends StatelessWidget {
  const NewsListTile({super.key, required this.itemId});
  final int itemId;

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return StreamBuilder(
        stream: bloc.items,
        builder:
            (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
          if (!snapshot.hasData) {
            return const Text('Stream loading');
          } else {
            return FutureBuilder(
              future: snapshot.data?[itemId],
              builder: (context, itemSnapshot) {
                print('0--------------0-------------0------------0');
                var tempdata = itemSnapshot.data;
                if (!itemSnapshot.hasData) {
                  return Text("Still loading item: $itemId");
                  //return Text('jj');
                } else
                  return Text(tempdata!.title);
              },
            );
          }
        });
  }
}
