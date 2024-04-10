// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_view_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FavoriteViewStateCWProxy {
  FavoriteViewState resultsEntity(List<ResultEntity>? resultsEntity);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FavoriteViewState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FavoriteViewState(...).copyWith(id: 12, name: "My name")
  /// ````
  FavoriteViewState call({
    List<ResultEntity>? resultsEntity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFavoriteViewState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFavoriteViewState.copyWith.fieldName(...)`
class _$FavoriteViewStateCWProxyImpl implements _$FavoriteViewStateCWProxy {
  const _$FavoriteViewStateCWProxyImpl(this._value);

  final FavoriteViewState _value;

  @override
  FavoriteViewState resultsEntity(List<ResultEntity>? resultsEntity) =>
      this(resultsEntity: resultsEntity);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FavoriteViewState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FavoriteViewState(...).copyWith(id: 12, name: "My name")
  /// ````
  FavoriteViewState call({
    Object? resultsEntity = const $CopyWithPlaceholder(),
  }) {
    return FavoriteViewState(
      resultsEntity == const $CopyWithPlaceholder()
          ? _value.resultsEntity
          // ignore: cast_nullable_to_non_nullable
          : resultsEntity as List<ResultEntity>?,
    );
  }
}

extension $FavoriteViewStateCopyWith on FavoriteViewState {
  /// Returns a callable class that can be used as follows: `instanceOfFavoriteViewState.copyWith(...)` or like so:`instanceOfFavoriteViewState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FavoriteViewStateCWProxy get copyWith =>
      _$FavoriteViewStateCWProxyImpl(this);
}
