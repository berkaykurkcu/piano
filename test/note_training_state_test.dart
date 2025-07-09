import 'package:flutter_test/flutter_test.dart';
import 'package:piano/piano.dart';

void main() {
  group('NoteTrainingState', () {
    test('has correct enum values', () {
      expect(NoteTrainingState.values.length, 4);
      expect(NoteTrainingState.values, [
        NoteTrainingState.none,
        NoteTrainingState.target,
        NoteTrainingState.correct,
        NoteTrainingState.incorrect,
      ]);
    });

    group('extension methods', () {
      test('isNone returns correct values', () {
        expect(NoteTrainingState.none.isNone, true);
        expect(NoteTrainingState.target.isNone, false);
        expect(NoteTrainingState.correct.isNone, false);
        expect(NoteTrainingState.incorrect.isNone, false);
      });

      test('isTarget returns correct values', () {
        expect(NoteTrainingState.none.isTarget, false);
        expect(NoteTrainingState.target.isTarget, true);
        expect(NoteTrainingState.correct.isTarget, false);
        expect(NoteTrainingState.incorrect.isTarget, false);
      });

      test('isCorrect returns correct values', () {
        expect(NoteTrainingState.none.isCorrect, false);
        expect(NoteTrainingState.target.isCorrect, false);
        expect(NoteTrainingState.correct.isCorrect, true);
        expect(NoteTrainingState.incorrect.isCorrect, false);
      });

      test('isIncorrect returns correct values', () {
        expect(NoteTrainingState.none.isIncorrect, false);
        expect(NoteTrainingState.target.isIncorrect, false);
        expect(NoteTrainingState.correct.isIncorrect, false);
        expect(NoteTrainingState.incorrect.isIncorrect, true);
      });

      test('needsUserInput returns correct values', () {
        expect(NoteTrainingState.none.needsUserInput, false);
        expect(NoteTrainingState.target.needsUserInput, true);
        expect(NoteTrainingState.correct.needsUserInput, false);
        expect(NoteTrainingState.incorrect.needsUserInput, false);
      });

      test('hasUserFeedback returns correct values', () {
        expect(NoteTrainingState.none.hasUserFeedback, false);
        expect(NoteTrainingState.target.hasUserFeedback, false);
        expect(NoteTrainingState.correct.hasUserFeedback, true);
        expect(NoteTrainingState.incorrect.hasUserFeedback, true);
      });
    });
  });
}