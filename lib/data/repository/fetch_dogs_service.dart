import 'package:dio/dio.dart';
import 'package:dog_pic/common/utils/api_error.dart';
import 'package:dog_pic/data/models/dogs_model.dart';
import 'package:riverpod/riverpod.dart';

class FetchDogsService {
  final Dio dio;
  // Constructor with optional Dio parameter for testing
  FetchDogsService({Dio? dio}) : dio = dio ?? Dio();

  Future<DogsModel> fetchRandomDogImages() async {
    try {
      final res = await dio.get("https://dog.ceo/api/breeds/image/random");
      final responseModel = DogsModel.fromJson(res.data);
      return responseModel;
    } on DioException catch (e) {
      final apiError = ApiError.fromDioError(e);
      return Future.error(apiError);
    } catch (_) {
      rethrow;
    }
  }
}

final dogsServiceProvider = Provider((ref) {
  return FetchDogsService();
});
