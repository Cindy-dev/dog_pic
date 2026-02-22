import 'package:dog_pic/data/models/dogs_model.dart';
import 'package:dog_pic/logic/dog_fetch_state.dart';
import 'package:dog_pic/logic/fetch_dog_view_model.dart';
import 'package:dog_pic/presentation/screens/dog_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeDogsViewModel extends FetchDogViewModel {
  FakeDogsViewModel(super.ref);
  @override
  Future<DogsModel> fetchDogs() async {
    state = SuccessState(
      dogsModel: DogsModel(message: "", status: "success"),
    );
    return DogsModel(message: "", status: "success");
  }
}

void main() {
  testWidgets('Press button calls fetchDogs()', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          fetchDogViewModel.overrideWith((ref) => FakeDogsViewModel(ref)),
        ],
        child: const MaterialApp(home: DogView()),
      ),
    );
    expect(find.text('Press'), findsOneWidget);
    await tester.tap(find.text('Press'));
    await tester.pump();
    expect(find.byType(CupertinoActivityIndicator), findsOneWidget);
  });
}