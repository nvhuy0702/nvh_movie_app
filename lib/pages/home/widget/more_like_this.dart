import 'package:flutter/material.dart';

import '../../../data/model/trending_model.dart';
class MoreLikeThis extends StatefulWidget {
  final TrendingModel? trendingModel;
  const MoreLikeThis({Key? key, this.trendingModel}) : super(key: key);

  @override
  State<MoreLikeThis> createState() => _MoreLikeThisState();
}

class _MoreLikeThisState extends State<MoreLikeThis> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.7,
        ),
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${widget.trendingModel?.results?[index].backdropPath}"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      color: const Color(0xFFEB455F),
                      borderRadius:
                      BorderRadius.circular(5)),
                  child: Text(
                    "${widget.trendingModel?.results?[index].voteAverage?.toStringAsFixed(1)}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          );
        });
  }
}
