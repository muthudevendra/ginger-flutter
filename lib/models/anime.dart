class Anime {
  final String requestHash;
  final bool requestCached;
  final int requestCacheExpiry;
  final List animes;

  Anime({
    this.requestHash,
    this.requestCached,
    this.requestCacheExpiry,
    this.animes
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    var animeList = json['top'] as List;
    return Anime(
      requestHash: json['request_hash'],
      requestCached: json['request_cached'],
      requestCacheExpiry: json['request_cache_expiry'],
      animes: animeList,
    );
  }
}