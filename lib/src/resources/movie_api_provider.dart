import 'dart:convert';


import 'package:blockproject/src/models/item_model.dart';
import 'package:http/http.dart';

class MovieApiProvider{
  Client client =  Client();
  final _apiKey = '8f4e6c9f655323e7750e69d51339976d';

  Future<ItemModel> fetchMovieList() async {
    print("Entered");
//   https://api.themoviedb.org/3/movie/550?api_key=8f4e6c9f655323e7750e69d51339976d
    /// // http://example.org/path?q=dart.
    /// Uri.http("example.org", "/path", { "q" : "dart" });
    var uri = Uri.https(" https://api.themoviedb.org","/3/movie/550", {"q":_apiKey});
    final response = await client.get(uri);
    print(response.body.toString());
    if (response.statusCode == 200) {
     return ItemModel.fromJson(json.decode(response.body));
    } else
      throw Exception("failed to load post");
  }
}