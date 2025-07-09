enum NoteTrainingState {
  none,        // Default state, no training context
  target,      // Note should be pressed (waiting for user input)
  correct,     // Note was pressed correctly
  incorrect,   // Note was pressed incorrectly
}

extension NoteTrainingStateExtension on NoteTrainingState {
  bool get isNone => this == NoteTrainingState.none;
  bool get isTarget => this == NoteTrainingState.target;
  bool get isCorrect => this == NoteTrainingState.correct;
  bool get isIncorrect => this == NoteTrainingState.incorrect;
  
  bool get needsUserInput => this == NoteTrainingState.target;
  bool get hasUserFeedback => this == NoteTrainingState.correct || this == NoteTrainingState.incorrect;
}