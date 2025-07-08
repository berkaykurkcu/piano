enum NoteNameSystem { alphabetic, solfege }

extension NoteNameSystemExtension on NoteNameSystem {
  String get displayName {
    switch (this) {
      case NoteNameSystem.alphabetic:
        return 'A-G (Alphabetic)';
      case NoteNameSystem.solfege:
        return 'Do-Re-Mi (Solfège)';
    }
  }

  String get identifier {
    switch (this) {
      case NoteNameSystem.alphabetic:
        return 'alphabetic';
      case NoteNameSystem.solfege:
        return 'solfege';
    }
  }

  bool get isAlphabetic => this == NoteNameSystem.alphabetic;
  bool get isSolfege => this == NoteNameSystem.solfege;
}