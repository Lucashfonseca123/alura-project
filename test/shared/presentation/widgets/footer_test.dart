import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_alura/build_config.dart';
import 'package:http/http.dart' as http;
import 'package:teste_alura/shared/presentation/widgets/footer.dart';

void main() {
  setUpAll(() {
    BuildConfig.prod();
  });

  testWidgets('Check the labels and keys in footer',
      (WidgetTester tester) async {
    // Monta o widget MyWidget
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(child: Footer()),
      ),
    ));

    expect(find.text('Hora de abraçar seu lado geek!'), findsOneWidget);
    expect(find.text('Funcionamento'), findsOneWidget);
    expect(find.byKey(const Key("date")), findsOneWidget);
  });
}
