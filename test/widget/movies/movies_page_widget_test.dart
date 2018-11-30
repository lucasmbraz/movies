import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/movies/movies_page.dart';

import '../repository/mock_movies_repository.dart';
import '../util/finders.dart';
import '../util/mock_http_client.dart';
//import 'package:movies/dependencyinjection/injector.dart';
//import 'package:movies/repository/movies_repository.dart';

void main() {
  FakeMoviesRepository moviesRepository = FakeMoviesRepository();

  setUp(() {
    HttpOverrides.global = TestHttpOverrides();
//    Injector().override(MoviesRepository, moviesRepository);
  });

  group("Movies Page", () {
    testWidgets("displays progress indicator on start", (tester) async {
      await tester.pumpWidget(MaterialApp(home: MoviesPage()));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();
    });

    testWidgets("dismisses progress indicator when data loaded", (tester) async {
      await tester.pumpWidget(MaterialApp(home: MoviesPage()));
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets("shows all movies", (tester) async {
      var sampleMovies = FakeMoviesRepository.SAMPLE_MOVIES;
      moviesRepository.respondWith(sampleMovies);

      await tester.pumpWidget(MaterialApp(home: MoviesPage()));
      await tester.pumpAndSettle();

      expect(findImage(sampleMovies.first.poster), findsOneWidget);

      await scrollDown(tester);
      expect(findImage(sampleMovies[3].poster), findsOneWidget);

      await scrollDown(tester);
      expect(findImage(sampleMovies.last.poster), findsOneWidget);
    });

    testWidgets("shows empty page when no movies are found", (tester) async {
      moviesRepository.respondWith([]);

      await tester.pumpWidget(MaterialApp(home: MoviesPage()));
      await tester.pumpAndSettle();

      expect(find.text("No movies found."), findsOneWidget);
    });

    testWidgets("shows error message when api call fails", (tester) async {
      moviesRepository.throwException(Exception("Error"));

      await tester.pumpWidget(MaterialApp(home: MoviesPage()));
      await tester.pumpAndSettle();

      expect(find.text("Something wrong happened. Please try again later."), findsOneWidget);
    });
  });
}

Future scrollDown(WidgetTester tester) async {
  await tester.drag(find.byType(CustomScrollView), new Offset(0.0, -312.0));
  await tester.pump();
}
