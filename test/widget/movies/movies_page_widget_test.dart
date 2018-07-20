import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/model/movie.dart';
import 'package:movies/movies/movies_page.dart';

import '../util/finders.dart';
import '../util/mock_http_client.dart';

void main() {
  setUp(() {
    HttpOverrides.global = TestHttpOverrides();
  });
  
  group("Movies Page", () {
    testWidgets("displays progress indicator on start", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: MoviesPage()));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();
    });

    testWidgets("dismisses progress indicator when data loaded", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: MoviesPage()));
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets("shows all movies", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: MoviesPage()));
      await tester.pumpAndSettle();

      expect(findImage(movies.first.poster), findsOneWidget);

      await scrollDown(tester);
      expect(findImage(movies[3].poster), findsOneWidget);

      await scrollDown(tester);
      expect(findImage(movies.last.poster), findsOneWidget);
    });
  });
}

Future scrollDown(WidgetTester tester) async {
  await tester.drag(find.byType(CustomScrollView), new Offset(0.0, -312.0));
  await tester.pump();
}