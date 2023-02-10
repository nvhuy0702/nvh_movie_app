
import 'dart:async';

import '../model/top_rated_movie.dart';
import '../service/top_rated_service.dart';

class TopRatedRepository {
  FutureOr<MovieTopRated> getUser() async {
    try {
      final result = await TopRatedService().getData();

      print('result ==> $result');
      return MovieTopRated.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }
}