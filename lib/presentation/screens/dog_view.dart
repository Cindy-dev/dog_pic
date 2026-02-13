import 'package:dog_pic/logic/dog_fetch_state.dart';
import 'package:dog_pic/logic/fetch_dog_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DogView extends ConsumerWidget {
  const DogView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataRef = ref.watch(fetchDogViewModel);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Dogs",
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  switch (dataRef) {
                    LoadingState() => CupertinoActivityIndicator(color: Colors.red),
                    SuccessState() => Container(
                      margin: EdgeInsets.all(20),
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(dataRef.dogsModel.message),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    ErrorState() => Text(
                      dataRef.error,
                      textAlign: TextAlign.center,
                    ),
                    (_) => Text(
                      "No data to Display",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                  },
                ],
              ),
            ),

            TextButton(
              style: TextButton.styleFrom(
                alignment: Alignment.center,
                minimumSize: Size(150, 50),
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                ref.read(fetchDogViewModel.notifier).fetchDogs();
              },
              child: Text(
                "Press",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
