import 'package:flutter/material.dart';
import 'package:flutter_image_search_app/common/enum/sort_category_enum.dart';
import 'package:flutter_image_search_app/domain/use_case/get_photo_use_case.dart';
import 'package:flutter_image_search_app/presentation/state/photo_screen_state.dart';

class PhotoScreenViewModel with ChangeNotifier {
  PhotoScreenState _state = PhotoScreenState();
  final GetPhotoUseCase _getPhotoUseCase;

  PhotoScreenViewModel({required GetPhotoUseCase getPhotoUseCase})
      : _getPhotoUseCase = getPhotoUseCase;

  PhotoScreenState get state => _state;

  Future<void> search({
    String? keyword,
    SortCategory? sortCategory,
  }) async {
    _isLoadingTrue(keyword: keyword, sortCategory: sortCategory);

    final photos = await _getPhotoUseCase.execute(
      _state.keyword,
      sortCategory: _state.sortCategory,
    );
    _state = _state.copyWith(
      isLoading: false,
      photos: photos,
    );
    notifyListeners();
  }

  Future<void> _isLoadingTrue({
    String? keyword,
    SortCategory? sortCategory,
  }) async {
    _state = _state.copyWith(
      isLoading: true,
      keyword: keyword,
      sortCategory: sortCategory,
    );
    notifyListeners();
  }
}
