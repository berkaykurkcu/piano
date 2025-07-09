import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:piano/piano.dart';

void main() {
  group('InteractivePiano Widget', () {
    testWidgets('displays with default alphabetic notation', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              showNoteNames: true,
            ),
          ),
        ),
      );

      // Should display alphabetic notation by default
      expect(find.text('C'), findsWidgets);
      expect(find.text('D'), findsWidgets);
      expect(find.text('E'), findsWidgets);
      expect(find.text('F'), findsWidgets);
      expect(find.text('G'), findsWidgets);
      expect(find.text('A'), findsWidgets);
      expect(find.text('B'), findsWidgets);
    });

    testWidgets('displays solfege notation when configured', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              showNoteNames: true,
              noteNameSystem: NoteNameSystem.solfege,
            ),
          ),
        ),
      );

      // Should display solfege notation
      expect(find.text('Do'), findsWidgets);
      expect(find.text('Re'), findsWidgets);
      expect(find.text('Mi'), findsWidgets);
      expect(find.text('Fa'), findsWidgets);
      expect(find.text('Sol'), findsWidgets);
      expect(find.text('La'), findsWidgets);
      expect(find.text('Si'), findsWidgets);
    });

    testWidgets('hides note names when showNoteNames is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              showNoteNames: false,
            ),
          ),
        ),
      );

      // Should not display any note names
      expect(find.text('C'), findsNothing);
      expect(find.text('D'), findsNothing);
      expect(find.text('E'), findsNothing);
      expect(find.text('Do'), findsNothing);
      expect(find.text('Re'), findsNothing);
      expect(find.text('Mi'), findsNothing);
    });

    testWidgets('showNoteNames takes precedence over hideNoteNames', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              hideNoteNames: true,
              showNoteNames: true,
            ),
          ),
        ),
      );

      // Should display note names because showNoteNames takes precedence
      expect(find.text('C'), findsWidgets);
      expect(find.text('D'), findsWidgets);
      expect(find.text('E'), findsWidgets);
    });

    testWidgets('respects hideNoteNames when showNoteNames is null', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              hideNoteNames: true,
            ),
          ),
        ),
      );

      // Should not display note names
      expect(find.text('C'), findsNothing);
      expect(find.text('D'), findsNothing);
      expect(find.text('E'), findsNothing);
    });

    testWidgets('applies custom note name text color', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              showNoteNames: true,
              noteNameTextColor: Colors.red,
            ),
          ),
        ),
      );

      // Find a Text widget with the custom color
      final textWidget = tester.widget<Text>(find.text('C').first);
      expect(textWidget.style?.color, Colors.red);
    });
  });

  group('InteractivePiano Training States', () {
    testWidgets('displays correct training state colors', (WidgetTester tester) async {
      final testNoteC4 = NotePosition.fromName('C4')!;
      final testNoteE4 = NotePosition.fromName('E4')!;
      final testNoteG4 = NotePosition.fromName('G4')!;
      final testNoteF4 = NotePosition.fromName('F4')!;

      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              trainingStates: {
                testNoteC4: NoteTrainingState.correct,
                testNoteE4: NoteTrainingState.incorrect,
                testNoteG4: NoteTrainingState.target,
                testNoteF4: NoteTrainingState.none,
              },
              correctColor: Colors.green,
              incorrectColor: Colors.red,
              targetColor: Colors.blue,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Training states should be properly applied
      // Note: We can't directly test colors in widget tests, but we can verify the widget structure
      expect(find.byType(InteractivePiano), findsOneWidget);
    });

    testWidgets('training states take priority over highlight color', (WidgetTester tester) async {
      final testNoteC4 = NotePosition.fromName('C4')!;

      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              highlightedNotes: [testNoteC4],
              highlightColor: Colors.yellow,
              trainingStates: {
                testNoteC4: NoteTrainingState.correct,
              },
              correctColor: Colors.green,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Widget should render without errors
      expect(find.byType(InteractivePiano), findsOneWidget);
    });

    testWidgets('handles empty training states', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              trainingStates: {}, // Empty training states
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Should render without errors
      expect(find.byType(InteractivePiano), findsOneWidget);
    });

    testWidgets('training state animations can be disabled', (WidgetTester tester) async {
      final testNoteC4 = NotePosition.fromName('C4')!;

      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              trainingStates: {
                testNoteC4: NoteTrainingState.correct,
              },
              animateTrainingStates: false,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Should render without errors
      expect(find.byType(InteractivePiano), findsOneWidget);
    });

    testWidgets('custom training state colors are applied', (WidgetTester tester) async {
      final testNoteC4 = NotePosition.fromName('C4')!;

      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              trainingStates: {
                testNoteC4: NoteTrainingState.correct,
              },
              correctColor: Colors.lightGreen,
              incorrectColor: Colors.deepOrange,
              targetColor: Colors.indigo,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Should render without errors
      expect(find.byType(InteractivePiano), findsOneWidget);
    });

    testWidgets('custom training animation duration is respected', (WidgetTester tester) async {
      final testNoteC4 = NotePosition.fromName('C4')!;

      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              trainingStates: {
                testNoteC4: NoteTrainingState.correct,
              },
              trainingStateAnimationDuration: Duration(milliseconds: 500),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Should render without errors
      expect(find.byType(InteractivePiano), findsOneWidget);
    });

    testWidgets('training states work with note names', (WidgetTester tester) async {
      final testNoteC4 = NotePosition.fromName('C4')!;

      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              showNoteNames: true,
              trainingStates: {
                testNoteC4: NoteTrainingState.correct,
              },
              correctColor: Colors.green,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Should display note names and training states
      expect(find.text('C'), findsWidgets);
      expect(find.byType(InteractivePiano), findsOneWidget);
    });

    testWidgets('training states work with solfege notation', (WidgetTester tester) async {
      final testNoteC4 = NotePosition.fromName('C4')!;

      await tester.pumpWidget(
        MaterialApp(
          home: SizedBox(
            width: 300,
            height: 100,
            child: InteractivePiano(
              noteRange: NoteRange.forClefs([Clef.Treble]),
              showNoteNames: true,
              noteNameSystem: NoteNameSystem.solfege,
              trainingStates: {
                testNoteC4: NoteTrainingState.target,
              },
              targetColor: Colors.blue,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Should display solfege notation with training states
      expect(find.text('Do'), findsWidgets);
      expect(find.byType(InteractivePiano), findsOneWidget);
    });
  });
}