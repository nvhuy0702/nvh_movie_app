import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';
import 'package:screenshot/screenshot.dart';
import '../../../data/model/cast_crew_model.dart';
import '../../../data/model/detail_movies_model.dart';
import '../../../data/model/top_rated_movie.dart';
import '../widget/chart_rating.dart';
import '../widget/comment.dart';
import '../widget/more_like_this.dart';
import '../widget/video_play.dart';
import 'package:intl/intl.dart';

class DetailMovie extends StatefulWidget {
  final MovieTopRated? movieTopRated;
  final int index;
  final MovieDetailModel? movieDetailModel;
  final CastCrewModel? castCrewModel;
  const DetailMovie({Key? key, this.movieTopRated, required this.index,this.movieDetailModel, this.castCrewModel}) : super(key: key);

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  late VideoPlayerController _controller;

  late Future<void> _initializeVideoPlayerFuture;
  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = widget.movieTopRated?.results?[widget.index];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://image.tmdb.org/t/p/w500${data?.backdropPath}",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data?.title ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/ribbon.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Screenshot(
                              controller: _screenshotController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  TextButton(
                                    onPressed: () async {
                                      await FlutterShare.share(
                                        title: 'Example share',
                                        text: 'Example share text',
                                        linkUrl: 'https://flutter.dev/',
                                        chooserTitle: 'Example Chooser Title',
                                      );
                                    },
                                    child: const Text('Share text and link'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Image.asset(
                        "assets/images/send.png",
                        width: 20,
                        height: 20,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFF2B3467),
                    ),
                    Text("${data?.voteAverage.toString()}"),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            builder: (BuildContext context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    height: 10,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  const Text(
                                    "Xếp hạng",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: '${data?.voteAverage.toString()} ',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: '/10',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 20,
                                                        color: Colors.black
                                                            .withOpacity(0.6)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 16,
                                            ),
                                            RatingBar.builder(
                                              initialRating: 3,
                                              minRating: 1,
                                              itemSize: 20,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              '(${data?.voteCount} đánh giá)',
                                            ),
                                          ],
                                        ),
                                        const VerticalDivider(
                                          thickness: 1,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              ChartRating(label: '5', pct: 89),
                                              ChartRating(label: '4', pct: 8),
                                              ChartRating(label: '3', pct: 2),
                                              ChartRating(label: '4', pct: 1),
                                              ChartRating(label: '1', pct: 0),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              side: const BorderSide(
                                                color: Color(0xff2B3467),
                                              ),
                                            ),
                                            padding: const EdgeInsets.all(12),
                                            backgroundColor: Colors.white,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Text(
                                              "Hủy",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding: const EdgeInsets.all(12),
                                              backgroundColor:
                                                  const Color(0xff2B3467)),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Text(
                                              "Bình chọn",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(10, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        ">",
                        style: TextStyle(
                          color: Color(0xFF2B3467),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(DateFormat("yyyy-MM-dd").format(data?.releaseDate ?? DateTime.now())),
                    _typeMovie(
                        content: "${data?.genreIds?.first} - ${data?.genreIds?.last}",
                        style: const TextStyle(
                            color: Color(0xFF2B3467), fontSize: 16)),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.all(12),
                        backgroundColor: const Color(0xff2B3467),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: const [
                            Icon(Icons.play_arrow),
                            Text(
                              "Xem",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Color(0xff2B3467),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        backgroundColor: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.download,
                              color: Colors.black,
                            ),
                            Text(
                              "Tải xuống",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Thể loại: ',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${widget.movieDetailModel?.genres?.first.name}',
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ReadMoreText(
                  data?.overview ?? "",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  lessStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  moreStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2B3467),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, indexCrew) => Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage("https://image.tmdb.org/t/p/w500${widget.castCrewModel?.cast?[indexCrew].profilePath}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        RichText(
                          text:  TextSpan(
                            text: '${widget.castCrewModel?.cast?[indexCrew].name}\n',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.castCrewModel?.cast?[indexCrew].knownForDepartment ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                    itemCount: 5,
                  ),
                ),
                DefaultTabController(
                  length: 4, // length of tabs
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const TabBar(
                        labelColor: Color(0xff2B3467),
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Color(0xFF0A2647),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 4,
                        tabs: [
                          Tab(text: 'Trailers'),
                          Tab(text: 'More like this'),
                          Tab(text: 'Bình luận'),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                        child: TabBarView(
                          children: <Widget>[
                            const VideoPlayerScreen(),
                            const MoreLikeThis(),
                            CommentWidget(
                              description: "",
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _typeMovie({String? content, TextStyle? style}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF2B3467), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        content ?? "",
        style: style,
      ),
    );
  }
}
