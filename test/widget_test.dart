import 'package:bolaji277/my_app.dart';
import 'package:bolaji277/feature/splash/view/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Splash Screen Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that SplashScreen is present.
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
