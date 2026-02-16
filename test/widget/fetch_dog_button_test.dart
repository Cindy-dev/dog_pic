import 'package:dog_pic/data/models/dogs_model.dart';
import 'package:dog_pic/data/repository/fetch_dogs_service.dart';
import 'package:dog_pic/presentation/screens/dog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeDogsService extends FetchDogsService {
  @override
  Future<DogsModel> fetchRandomDogImages() async {
    return DogsModel(message: "", status: "success");
  }
}

void main() {
  testWidgets('Press button calls fetchDogs()', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [dogsServiceProvider.overrideWithValue(FakeDogsService())],
        child: const MaterialApp(home: DogView()),
      ),
    );
    expect(find.text('Press'), findsOneWidget);
    await tester.tap(find.text('Press'));
    await tester.pumpAndSettle();
  });
}
