import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_facturas/main.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(MyApp), findsOneWidget);
  });
}
