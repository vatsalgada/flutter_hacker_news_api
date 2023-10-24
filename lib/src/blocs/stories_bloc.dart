import 'package:rxdart/rxdart.dart';
import '../models/items_model.dart';
import '../resources/repository.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>?>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();
  final _itemsFetcher = PublishSubject<int>();

  //Getters to get streams
  Stream<List<int>?> get topIds => _topIds.stream;
  Stream<Map<int, Future<ItemModel>>> get items => _itemsOutput.stream;

  //Getter to sinks
  Function(int) get fetchItem => _itemsFetcher.sink.add;

  StoriesBloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

//transformer to help listview fetch Ids and return result based on a id-result map
//cache - accumulated
//id - value

  _itemsTransformer() {
    return ScanStreamTransformer(
      (cache, int id, index) {
        print('sdjfnjkdsnjf');
        cache[id] = _repository.fetchItem(id);
        print(cache);
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}
