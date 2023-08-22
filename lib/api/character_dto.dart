part of api;

class CharacterDto {
  CharacterDto({
    required this.results,
    this.info,
  });

  Info? info;
  List<Character> results;

  factory CharacterDto.fromJson(List<dynamic> jsonList) => CharacterDto(
        results: List<Character>.generate(
          jsonList.length,
          (int index) => Character.fromJson(jsonList[index]),
        ),
      );

  Map<String, dynamic> toJson() => {
        "info": info?.toJson(),
        "results": List<dynamic>.from(
          results.map(
            (x) => x.toJson(),
          ),
        ),
      };
}
