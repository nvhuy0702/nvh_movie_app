import 'package:flutter/material.dart';

import '../../../data/model/top_rated_movie.dart';
import '../../../data/model/upcoming_movies_model.dart';

class TopMoviesScreen extends StatefulWidget {
  final MovieTopRated? movieTopRated;
  final MoviesUpComingModel? moviesUpComing;

  const TopMoviesScreen({Key? key, this.movieTopRated, this.moviesUpComing}) : super(key: key);

  @override
  State<TopMoviesScreen> createState() => _TopMoviesScreenState();
}

class _TopMoviesScreenState extends State<TopMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "10 bộ phim trong tuần này",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 1,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext ctx, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500${widget.movieTopRated?.results?[index].backdropPath ?? widget.moviesUpComing?.results?[index].backdropPath}",
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEB455F),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "${widget.movieTopRated?.results?[index].voteAverage ?? widget.moviesUpComing?.results?[index].voteAverage}",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
