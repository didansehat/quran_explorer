import 'package:flutter_test/flutter_test.dart';
import 'package:quran_explorer2/main.dart';

void main() {
  testWidgets('Aplikasi berhasil dijalankan tanpa error', (WidgetTester tester) async {

    await tester.pumpWidget(const QuranApp());


    expect(find.text("Al-Qur'an Explorer"), findsOneWidget);
  });
}