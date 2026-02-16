import 'package:dog_pic/presentation/screens/dog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Press button calls fetchDogs()', (tester) async {
    await tester.pumpWidget(
      ProviderScope(child: const MaterialApp(home: DogView())),
    );
    expect(find.text('Press'), findsOneWidget);
    await tester.tap(find.text('Press'));
    await tester.pumpAndSettle();
    expect(find.byType(Container), findsOneWidget);
  });
}
