import 'note_position.dart';
import 'note_name_system.dart';

class NoteNameConverter {
  static const Map<Note, String> _noteToSolfege = {
    Note.C: 'Do',
    Note.D: 'Re',
    Note.E: 'Mi',
    Note.F: 'Fa',
    Note.G: 'Sol',
    Note.A: 'La',
    Note.B: 'Si',
  };

  static const Map<Note, String> _noteToAlphabetic = {
    Note.C: 'C',
    Note.D: 'D',
    Note.E: 'E',
    Note.F: 'F',
    Note.G: 'G',
    Note.A: 'A',
    Note.B: 'B',
  };

  static const Map<String, Note> _alphabeticToNote = {
    'C': Note.C,
    'D': Note.D,
    'E': Note.E,
    'F': Note.F,
    'G': Note.G,
    'A': Note.A,
    'B': Note.B,
  };

  static const Map<String, Note> _solfegeToNote = {
    'Do': Note.C,
    'Re': Note.D,
    'Mi': Note.E,
    'Fa': Note.F,
    'Sol': Note.G,
    'La': Note.A,
    'Si': Note.B,
  };

  static String convertNote(Note note, NoteNameSystem system) {
    if (system.isAlphabetic) {
      return _noteToAlphabetic[note] ?? 'Unknown';
    } else {
      return _noteToSolfege[note] ?? 'Unknown';
    }
  }

  static Note? parseNote(String noteName, NoteNameSystem system) {
    if (system.isAlphabetic) {
      return _alphabeticToNote[noteName.toUpperCase()];
    } else {
      return _solfegeToNote[_capitalizeSolfege(noteName)];
    }
  }

  static String _capitalizeSolfege(String solfege) {
    if (solfege.isEmpty) return solfege;
    return solfege[0].toUpperCase() + solfege.substring(1).toLowerCase();
  }

  static List<String> getAllNoteNames(NoteNameSystem system) {
    if (system.isAlphabetic) {
      return _noteToAlphabetic.values.toList();
    } else {
      return _noteToSolfege.values.toList();
    }
  }
}