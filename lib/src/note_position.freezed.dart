// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotePosition {
  Note get note;
  int get octave;
  Accidental get accidental;

  /// Create a copy of NotePosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotePositionCopyWith<NotePosition> get copyWith =>
      _$NotePositionCopyWithImpl<NotePosition>(
          this as NotePosition, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotePosition &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.octave, octave) || other.octave == octave) &&
            (identical(other.accidental, accidental) ||
                other.accidental == accidental));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note, octave, accidental);

  @override
  String toString() {
    return 'NotePosition(note: $note, octave: $octave, accidental: $accidental)';
  }
}

/// @nodoc
abstract mixin class $NotePositionCopyWith<$Res> {
  factory $NotePositionCopyWith(
          NotePosition value, $Res Function(NotePosition) _then) =
      _$NotePositionCopyWithImpl;
  @useResult
  $Res call({Note note, int octave, Accidental accidental});
}

/// @nodoc
class _$NotePositionCopyWithImpl<$Res> implements $NotePositionCopyWith<$Res> {
  _$NotePositionCopyWithImpl(this._self, this._then);

  final NotePosition _self;
  final $Res Function(NotePosition) _then;

  /// Create a copy of NotePosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? note = null,
    Object? octave = null,
    Object? accidental = null,
  }) {
    return _then(_self.copyWith(
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      octave: null == octave
          ? _self.octave
          : octave // ignore: cast_nullable_to_non_nullable
              as int,
      accidental: null == accidental
          ? _self.accidental
          : accidental // ignore: cast_nullable_to_non_nullable
              as Accidental,
    ));
  }
}

/// @nodoc

class _NotePosition implements NotePosition {
  _NotePosition(
      {required this.note, this.octave = 4, this.accidental = Accidental.None});

  @override
  final Note note;
  @override
  @JsonKey()
  final int octave;
  @override
  @JsonKey()
  final Accidental accidental;

  /// Create a copy of NotePosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotePositionCopyWith<_NotePosition> get copyWith =>
      __$NotePositionCopyWithImpl<_NotePosition>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotePosition &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.octave, octave) || other.octave == octave) &&
            (identical(other.accidental, accidental) ||
                other.accidental == accidental));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note, octave, accidental);

  @override
  String toString() {
    return 'NotePosition(note: $note, octave: $octave, accidental: $accidental)';
  }
}

/// @nodoc
abstract mixin class _$NotePositionCopyWith<$Res>
    implements $NotePositionCopyWith<$Res> {
  factory _$NotePositionCopyWith(
          _NotePosition value, $Res Function(_NotePosition) _then) =
      __$NotePositionCopyWithImpl;
  @override
  @useResult
  $Res call({Note note, int octave, Accidental accidental});
}

/// @nodoc
class __$NotePositionCopyWithImpl<$Res>
    implements _$NotePositionCopyWith<$Res> {
  __$NotePositionCopyWithImpl(this._self, this._then);

  final _NotePosition _self;
  final $Res Function(_NotePosition) _then;

  /// Create a copy of NotePosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? note = null,
    Object? octave = null,
    Object? accidental = null,
  }) {
    return _then(_NotePosition(
      note: null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      octave: null == octave
          ? _self.octave
          : octave // ignore: cast_nullable_to_non_nullable
              as int,
      accidental: null == accidental
          ? _self.accidental
          : accidental // ignore: cast_nullable_to_non_nullable
              as Accidental,
    ));
  }
}

// dart format on
