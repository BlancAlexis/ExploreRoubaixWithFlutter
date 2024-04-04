// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DetailViewStateCWProxy {
  DetailViewState resultEntity(ResultEntity? resultEntity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DetailViewState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DetailViewState(...).copyWith(id: 12, name: "My name")
  /// ````
  DetailViewState call({
    ResultEntity? resultEntity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDetailViewState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDetailViewState.copyWith.fieldName(...)`
class _$DetailViewStateCWProxyImpl implements _$DetailViewStateCWProxy {
  const _$DetailViewStateCWProxyImpl(this._value);

  final DetailViewState _value;

  @override
  DetailViewState resultEntity(ResultEntity? resultEntity) =>
      this(resultEntity: resultEntity);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DetailViewState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DetailViewState(...).copyWith(id: 12, name: "My name")
  /// ````
  DetailViewState call({
    Object? resultEntity = const $CopyWithPlaceholder(),
  }) {
    return DetailViewState(
      resultEntity == const $CopyWithPlaceholder()
          ? _value.resultEntity
          // ignore: cast_nullable_to_non_nullable
          : resultEntity as ResultEntity?,
    );
  }
}

extension $DetailViewStateCopyWith on DetailViewState {
  /// Returns a callable class that can be used as follows: `instanceOfDetailViewState.copyWith(...)` or like so:`instanceOfDetailViewState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DetailViewStateCWProxy get copyWith => _$DetailViewStateCWProxyImpl(this);
}
