import 'package:flutter/material.dart';
import 'package:flutter_hacker_news_api/src/blocs/stories_bloc.dart';
import 'package:flutter_hacker_news_api/src/blocs/stories_provider.dart';
import 'package:flutter_hacker_news_api/src/widgets/news_list_tile.dart';

class NewsList extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    bloc.fetchTopIds();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
        centerTitle: true,
      ),
      body: buildList(bloc),
    );
  }
}

Widget buildList(StoriesBloc bloc) {
  return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print(snapshot.data);
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, int index) {
              final temp = snapshot.data?[index];
              return NewsListTile(itemId: snapshot.data![index]);
            },
          );
        }
      });
}
