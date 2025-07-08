import 'package:flutter_test/flutter_test.dart';
import 'package:piano/piano.dart';

void main() {
  group('NoteNameConverter', () {
    group('convertNote', () {
      test('converts all notes to alphabetic notation', () {
        expect(NoteNameConverter.convertNote(Note.C, NoteNameSystem.alphabetic), 'C');
        expect(NoteNameConverter.convertNote(Note.D, NoteNameSystem.alphabetic), 'D');
        expect(NoteNameConverter.convertNote(Note.E, NoteNameSystem.alphabetic), 'E');
        expect(NoteNameConverter.convertNote(Note.F, NoteNameSystem.alphabetic), 'F');
        expect(NoteNameConverter.convertNote(Note.G, NoteNameSystem.alphabetic), 'G');
        expect(NoteNameConverter.convertNote(Note.A, NoteNameSystem.alphabetic), 'A');
        expect(NoteNameConverter.convertNote(Note.B, NoteNameSystem.alphabetic), 'B');
      });

      test('converts all notes to solfege notation', () {
        expect(NoteNameConverter.convertNote(Note.C, NoteNameSystem.solfege), 'Do');
        expect(NoteNameConverter.convertNote(Note.D, NoteNameSystem.solfege), 'Re');
        expect(NoteNameConverter.convertNote(Note.E, NoteNameSystem.solfege), 'Mi');
        expect(NoteNameConverter.convertNote(Note.F, NoteNameSystem.solfege), 'Fa');
        expect(NoteNameConverter.convertNote(Note.G, NoteNameSystem.solfege), 'Sol');
        expect(NoteNameConverter.convertNote(Note.A, NoteNameSystem.solfege), 'La');
        expect(NoteNameConverter.convertNote(Note.B, NoteNameSystem.solfege), 'Si');
      });
    });

    group('parseNote', () {
      test('parses alphabetic notation correctly', () {
        expect(NoteNameConverter.parseNote('C', NoteNameSystem.alphabetic), Note.C);
        expect(NoteNameConverter.parseNote('D', NoteNameSystem.alphabetic), Note.D);
        expect(NoteNameConverter.parseNote('E', NoteNameSystem.alphabetic), Note.E);
        expect(NoteNameConverter.parseNote('F', NoteNameSystem.alphabetic), Note.F);
        expect(NoteNameConverter.parseNote('G', NoteNameSystem.alphabetic), Note.G);
        expect(NoteNameConverter.parseNote('A', NoteNameSystem.alphabetic), Note.A);
        expect(NoteNameConverter.parseNote('B', NoteNameSystem.alphabetic), Note.B);
      });

      test('parses lowercase alphabetic notation correctly', () {
        expect(NoteNameConverter.parseNote('c', NoteNameSystem.alphabetic), Note.C);
        expect(NoteNameConverter.parseNote('d', NoteNameSystem.alphabetic), Note.D);
        expect(NoteNameConverter.parseNote('e', NoteNameSystem.alphabetic), Note.E);
        expect(NoteNameConverter.parseNote('f', NoteNameSystem.alphabetic), Note.F);
        expect(NoteNameConverter.parseNote('g', NoteNameSystem.alphabetic), Note.G);
        expect(NoteNameConverter.parseNote('a', NoteNameSystem.alphabetic), Note.A);
        expect(NoteNameConverter.parseNote('b', NoteNameSystem.alphabetic), Note.B);
      });

      test('parses solfege notation correctly', () {
        expect(NoteNameConverter.parseNote('Do', NoteNameSystem.solfege), Note.C);
        expect(NoteNameConverter.parseNote('Re', NoteNameSystem.solfege), Note.D);
        expect(NoteNameConverter.parseNote('Mi', NoteNameSystem.solfege), Note.E);
        expect(NoteNameConverter.parseNote('Fa', NoteNameSystem.solfege), Note.F);
        expect(NoteNameConverter.parseNote('Sol', NoteNameSystem.solfege), Note.G);
        expect(NoteNameConverter.parseNote('La', NoteNameSystem.solfege), Note.A);
        expect(NoteNameConverter.parseNote('Si', NoteNameSystem.solfege), Note.B);
      });

      test('parses mixed case solfege notation correctly', () {
        expect(NoteNameConverter.parseNote('do', NoteNameSystem.solfege), Note.C);
        expect(NoteNameConverter.parseNote('RE', NoteNameSystem.solfege), Note.D);
        expect(NoteNameConverter.parseNote('mI', NoteNameSystem.solfege), Note.E);
        expect(NoteNameConverter.parseNote('fA', NoteNameSystem.solfege), Note.F);
        expect(NoteNameConverter.parseNote('sOL', NoteNameSystem.solfege), Note.G);
        expect(NoteNameConverter.parseNote('lA', NoteNameSystem.solfege), Note.A);
        expect(NoteNameConverter.parseNote('sI', NoteNameSystem.solfege), Note.B);
      });

      test('returns null for invalid note names', () {
        expect(NoteNameConverter.parseNote('H', NoteNameSystem.alphabetic), null);
        expect(NoteNameConverter.parseNote('Ti', NoteNameSystem.solfege), null);
        expect(NoteNameConverter.parseNote('', NoteNameSystem.alphabetic), null);
        expect(NoteNameConverter.parseNote('', NoteNameSystem.solfege), null);
      });
    });

    group('getAllNoteNames', () {
      test('returns all alphabetic note names', () {
        final names = NoteNameConverter.getAllNoteNames(NoteNameSystem.alphabetic);
        expect(names, ['C', 'D', 'E', 'F', 'G', 'A', 'B']);
      });

      test('returns all solfege note names', () {
        final names = NoteNameConverter.getAllNoteNames(NoteNameSystem.solfege);
        expect(names, ['Do', 'Re', 'Mi', 'Fa', 'Sol', 'La', 'Si']);
      });
    });
  });
}