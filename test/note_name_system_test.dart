import 'package:flutter_test/flutter_test.dart';
import 'package:piano/piano.dart';

void main() {
  group('NoteNameSystem', () {
    test('has correct values', () {
      expect(NoteNameSystem.values.length, 2);
      expect(NoteNameSystem.values, [NoteNameSystem.alphabetic, NoteNameSystem.solfege]);
    });

    group('displayName extension', () {
      test('returns correct display names', () {
        expect(NoteNameSystem.alphabetic.displayName, 'A-G (Alphabetic)');
        expect(NoteNameSystem.solfege.displayName, 'Do-Re-Mi (Solfège)');
      });
    });

    group('identifier extension', () {
      test('returns correct identifiers', () {
        expect(NoteNameSystem.alphabetic.identifier, 'alphabetic');
        expect(NoteNameSystem.solfege.identifier, 'solfege');
      });
    });

    group('boolean helpers', () {
      test('isAlphabetic returns correct values', () {
        expect(NoteNameSystem.alphabetic.isAlphabetic, true);
        expect(NoteNameSystem.solfege.isAlphabetic, false);
      });

      test('isSolfege returns correct values', () {
        expect(NoteNameSystem.alphabetic.isSolfege, false);
        expect(NoteNameSystem.solfege.isSolfege, true);
      });
    });
  });
}