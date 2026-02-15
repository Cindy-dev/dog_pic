import 'package:dog_pic/data/models/dogs_model.dart';
import 'package:dog_pic/logic/dog_fetch_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../data/repository/fetch_dogs_service.dart';

class FetchDogViewModel extends StateNotifier<DogFetchState> {
  final Ref ref;

  FetchDogViewModel(this.ref) : super(InitialState());

  Future<DogsModel> fetchDogs() async {
    try {
      state = LoadingState();
      final data = await ref.read(dogsServiceProvider).fetchRandomDogImages();
      state = SuccessState(dogsModel: data);
      return data;
    } catch (e) {
      state =  ErrorState(error: e.toString());
      rethrow;
    }
  }
}

final fetchDogViewModel = StateNotifierProvider((ref) {
  return FetchDogViewModel(ref);
});
