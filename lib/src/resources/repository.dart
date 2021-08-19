import 'package:blockproject/src/models/item_model.dart';

import 'movie_api_provider.dart';

class Repository{
 MovieApiProvider movieApiProvider = MovieApiProvider();

 Future<ItemModel> fetchAllMovies(){
   return movieApiProvider.fetchMovieList();
 }
}