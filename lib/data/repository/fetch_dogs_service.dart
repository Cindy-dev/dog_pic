import 'package:dio/dio.dart';
import 'package:dog_pic/data/models/dogs_model.dart';
import 'package:riverpod/riverpod.dart';

class FetchDogsService {
  final Dio dio = Dio();

  Future<DogsModel> fetchRandomDogImages() async {
    try {
      final res = await dio.get("https://dog.ceo/api/breeds/image/random");
      final responseModel = DogsModel.fromJson(res.data);
      return responseModel;
    } catch (e) {
      rethrow;
    }
  }
}

final dogsServiceProvider = Provider((ref) {
  return FetchDogsService();
});
