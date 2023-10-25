import 'package:flutter/material.dart';
import 'package:flutter_hacker_news_api/src/blocs/stories_bloc.dart';
import 'package:flutter_hacker_news_api/src/blocs/stories_provider.dart';
import 'package:flutter_hacker_news_api/src/models/items_model.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;
  const NewsListTile({required this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return StreamBuilder(
        stream: bloc.items,
        builder:
            (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
          if (!snapshot.hasData) {
            print('$snapshot.data');
            return CircularProgressIndicator();
          }

          return FutureBuilder(
            future: snapshot.data?[itemId],
            builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
              var tempdata = itemSnapshot.data;
              print('tempdata is $tempdata');
              var temp2 = snapshot.data?[itemId];
              print('temp 2 is $temp2');
              print('ItemID is $itemId');
              if (!itemSnapshot.hasData) {
                return Text("Still loading item: $itemId");
              } else
                return Text(tempdata!.title);
            },
          );
        });
  }
}
