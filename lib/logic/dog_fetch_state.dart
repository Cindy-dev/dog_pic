import 'package:dog_pic/data/models/dogs_model.dart';

abstract class DogFetchState {
  const DogFetchState();
}

class InitialState extends DogFetchState {
  const InitialState();
}

class LoadingState extends DogFetchState {
  const LoadingState();
}

class SuccessState extends DogFetchState {
  final DogsModel dogsModel;
  const SuccessState({required this.dogsModel});
}

class ErrorState extends DogFetchState {
  final String error;
  const ErrorState({required this.error});
}
