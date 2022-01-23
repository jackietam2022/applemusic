class AppleDate {
  final int resultCount;
  final List<Results> results;

  AppleDate({required this.resultCount, required this.results});

  factory AppleDate.fromJson(Map<String, dynamic> json) {
    final resultCount = json['resultCount'] as int;
    final resultdata = json['results'] as List<dynamic>?;
    final results = resultdata != null
        ? resultdata.map((resultdate) => Results.fromJson(resultdate)).toList()
        : <Results>[];

    return AppleDate(resultCount: resultCount, results: results);
  }
}

class Results {
  final String wrapperType;
  final String artistName;
  final String artworkUrl100;

  Results({
    required this.wrapperType,
    required this.artistName,
    required this.artworkUrl100,
  });

  factory Results.fromJson(Map<String, dynamic> Json) {
    return Results(
      wrapperType: Json['wrapperType'],
      artistName: Json['artistName'],
      artworkUrl100: Json['artworkUrl100'],
    );
  }

  Map<String, dynamic> toJson() => {
        wrapperType: wrapperType,
        artistName: artistName,
        artworkUrl100: artworkUrl100,
      };
}
