import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nvh_movie_app/pages/home/screens/detail_movie.dart';
import 'package:nvh_movie_app/pages/home/screens/profile_screen.dart';
import 'package:nvh_movie_app/pages/home/screens/top_movie_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliver_header_delegate/sliver_header_delegate.dart';

import '../../../data/repository/movies_repository.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  final TextEditingController _search = TextEditingController();
  final _focusNode = FocusNode();

  final HomeBloc _bloc = HomeBloc(MoviesRepository());

  @override
  void initState() {
    _bloc.add(FetchMoviesTopRated());
    _bloc.add(FetchMoviesPopular());
    _bloc.add(FetchMoviesUpComing());
    _bloc.add(FetchTrending());
    super.initState();
    _pageController = PageController();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigator(),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: _bloc,
        builder: (context, state) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverPersistentHeader(
                    delegate: FlexibleHeaderDelegate(
                      leading: const SizedBox.shrink(),
                      expandedHeight: 400,
                      background: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          height: MediaQuery.of(context).size.height,
                        ),
                        items: state.popularMovies?.results == null
                            ? [
                                _shimmer(),
                              ]
                            : state.popularMovies?.results
                                ?.map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://image.tmdb.org/t/p/w500${e.backdropPath}",
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Top 10 b??? phim trong tu???n",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => TopMoviesScreen(
                                              movieTopRated:
                                                  state.movieTopRated,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Xem t???t c???",
                                        style:
                                            TextStyle(color: Color(0xff2B3467)),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 200,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 10,
                                    ),
                                    itemCount: 10,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: InkWell(
                                          onTap: () {
                                            _bloc.add(FetchMovieDetail(
                                                movieId: _bloc
                                                    .state
                                                    .movieTopRated
                                                    ?.results?[index]
                                                    .id
                                                    .toString()));
                                            _bloc.add(FetchCastCrew(
                                                movieId: _bloc
                                                    .state
                                                    .movieTopRated
                                                    ?.results?[index]
                                                    .id
                                                    .toString()));
                                            Future.delayed(
                                                    const Duration(seconds: 1))
                                                .then((value) =>
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (_) =>
                                                            DetailMovie(
                                                          index: index,
                                                          movieTopRated: state
                                                              .movieTopRated,
                                                          castCrewModel: state
                                                              .castCrewModel,
                                                          movieDetailModel:
                                                              state
                                                                  .moviesDetail,
                                                              trendingModel: state.trendingModel,
                                                        ),
                                                      ),
                                                    ));
                                          },
                                          child: state.movieTopRated?.results ==
                                                  null
                                              ? _shimmer()
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        "https://image.tmdb.org/t/p/w500${state.movieTopRated?.results?[index].backdropPath}",
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Ph??t h??nh m???i",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => TopMoviesScreen(
                                              moviesUpComing:
                                                  state.moviesUpComing,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Xem t???t c???",
                                        style:
                                            TextStyle(color: Color(0xff2B3467)),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 200,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 10,
                                    ),
                                    itemCount: 10,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: state.moviesUpComing?.results ==
                                              null
                                          ? _shimmer()
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://image.tmdb.org/t/p/w500${state.moviesUpComing?.results?[index].backdropPath}",
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFF2B3467)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  prefixIcon: const Icon(Icons.search),
                                  labelText: "T??m ki???m",
                                  filled: true,
                                  fillColor: const Color(0xFFEEEEEE),
                                ),
                                controller: _search,
                                focusNode: _focusNode,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFBAD7E9),
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: const EdgeInsets.all(12),
                                  child: GestureDetector(
                                    child: Image.asset(
                                      "assets/images/filter.png",
                                      color: const Color(0xFF2B3467),
                                      fit: BoxFit.cover,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        _focusNode.hasFocus
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      const Text(
                                        "T??m ki???m h??ng ?????u",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                            height: 10,
                                          ),
                                          itemCount: 4,
                                          itemBuilder: (context, index) => Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    top: 10, bottom: 10),
                                                height: 100,
                                                width: 100,
                                                color: Colors.yellow,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              const Text("abc")
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 400,
                                      childAspectRatio: 0.7,
                                    ),
                                    itemCount: 10,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: Stack(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                    "assets/images/dr_strange.jpg",
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              margin: const EdgeInsets.only(
                                                  left: 8),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFEB455F),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: const Text(
                                                "7.4",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
              const ProfileScreen(),
            ],
          );
        },
      ),
    );
  }

  Widget _shimmer() {
    return SizedBox(
      height: 100,
      width: 300,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300] ?? Colors.yellow,
        highlightColor: Colors.grey[100] ?? Colors.yellow,
        child: Container(
          height: 50,
          width: 200,
          color: Colors.yellow,
        ),
      ),
    );
  }

  Widget _bottomNavigator() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        backgroundColor: const Color(0xFFECF9FF),
        itemCornerRadius: 20,
        curve: Curves.easeIn,
        onItemSelected: (index1) {
          setState(() {
            _currentIndex = index1;
            _pageController.jumpToPage(index1);
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Image.asset(
              "assets/images/home.png",
              height: 30,
              width: 30,
            ),
            title: const Text('Trang ch???'),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Image.asset(
              "assets/images/explore.png",
              height: 30,
              width: 30,
            ),
            title: const Text('Kh??m ph??'),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Image.asset(
              "assets/images/ribbon.png",
              height: 30,
              width: 30,
            ),
            title: const Text(
              'Danh s??ch',
            ),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Image.asset(
              "assets/images/download.png",
              height: 30,
              width: 30,
            ),
            title: const Text('T???i xu???ng'),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Image.asset(
              "assets/images/user.png",
              height: 30,
              width: 30,
            ),
            title: const Text('T??i kho???n'),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
