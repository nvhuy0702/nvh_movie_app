class ApiMovie {
  static const baseUrl = "";
  static const key = "b885224e32ae22bdc4af7c0177ae0eb7";
  static const topRated = "https://api.themoviedb.org/3/movie/top_rated?api_key=$key&language=en-US&page=1";
  static const popular = "https://api.themoviedb.org/3/movie/popular?api_key=$key&language=en-US&page=1";
  static const upcoming = "https://api.themoviedb.org/3/movie/upcoming?api_key=$key&language=en-US&page=1";
  static const trending = "https://api.themoviedb.org/3/trending/all/day?api_key=$key";
}