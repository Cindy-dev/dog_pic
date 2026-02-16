import 'package:dog_pic/main.dart' as app;
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Full dog fetch flow works', (WidgetTester tester) async {

    // Launch full app
    app.main();
    await tester.pumpAndSettle();

    // Verify button is visible
    expect(find.text("Press"), findsOneWidget);

    // Tap button
    await tester.tap(find.text("Press"));
    await tester.pump();

    // Loading should appear
    expect(find.byType(CupertinoActivityIndicator), findsOneWidget);

    // Wait for network + rebuild
    await tester.pumpAndSettle();

    // Success container should appear
    expect(find.byType(Container), findsOneWidget);
  });
}
