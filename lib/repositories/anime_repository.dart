import 'package:ginger/models/anime.dart';
import 'package:ginger/services/api_base_helper.dart';

class AnimeRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List> fetchPopularAnimeList() async {
    try {
      final response = await _helper.get('/top/anime/1/bypopularity');
      return Anime.fromJson(response).animes;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List> fetchOngoingAnimeList() async {
    try {
      final response = await _helper.get('/top/anime/1/airing');
      return Anime.fromJson(response).animes;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List> fetchUpcomingAnimeList() async {
    try {
      final response = await _helper.get('/top/anime/1/upcoming');
      return Anime.fromJson(response).animes;
    } catch (e) {
      throw Exception(e);
    }
  }
}