import 'dart:convert';

import 'package:blockproject/src/models/item_model.dart';
import 'package:http/http.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = "8f4e6c9f655323e7750e69d51339976d";

  Future<ItemModel> fetchMovieList() async {
    var uri = Uri.http(
        "api.themoviedb.org", "/3/movie/popular", {"api_key": _apiKey});
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else
      throw Exception("failed to load post");
  }
}
