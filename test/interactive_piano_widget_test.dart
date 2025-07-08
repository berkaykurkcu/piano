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
}