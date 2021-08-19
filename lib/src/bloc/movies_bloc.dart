import 'package:blockproject/src/models/item_model.dart';
import 'package:blockproject/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc{
  final repository = Repository();
  final _moviesStreamController = PublishSubject<ItemModel>();

  Stream<ItemModel> get allMoviesFromStream => _moviesStreamController.stream;

  Future addMoviesToSink ()async{
    ItemModel itemModel = await repository.fetchAllMovies();
    _moviesStreamController.sink.add(itemModel) ;
  }

  dispose (){
    _moviesStreamController.close();
  }

}
final bloc = MoviesBloc();