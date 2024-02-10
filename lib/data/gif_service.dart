import 'fetchHelper.dart';

class GifService {
  Future<List<dynamic>> getGifsByParameters(value) async {
    FetchHelper fetchData = FetchHelper(parameters: value);
    var decodedData = await fetchData.fetchGifs();
    return decodedData;
  }
}
