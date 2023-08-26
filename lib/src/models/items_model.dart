class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> paresedJson)
      : id = paresedJson['id'],
        deleted = paresedJson['deleted'],
        type = paresedJson['type'],
        by = paresedJson['by'],
        time = paresedJson['time'],
        text = paresedJson['text'],
        dead = paresedJson['dead'],
        parent = paresedJson['parent'],
        kids = paresedJson['kids'],
        url = paresedJson['url'],
        title = paresedJson['title'],
        score = paresedJson['score'],
        descendants = paresedJson['descendants'];
}
