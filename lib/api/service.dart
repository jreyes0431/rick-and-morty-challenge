part of api;

class ApiService {
  ApiService._();

  static final ApiService instance = ApiService._();

  Future<List<Character>> getCharacters([
    List<String> itemsId = const <String>['1', '2', '3', '4', '5'],
  ]) async {
    try {
      http.Client client = http.Client();
      Uri uri = Uri.parse('$characterUrl/$itemsId');
      http.Response response = await client.get(uri);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        String res = response.body;
        return CharacterDto.fromJson(json.decode(res)).results;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
