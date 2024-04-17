import 'package:flutter_image_search_app/common/enum/sort_category_enum.dart';
import 'package:flutter_image_search_app/domain/model/photo.dart';

class PhotoScreenState {
  final bool isLoading;
  final List<Photo> photos;
  final SortCategory sortCategory;
  final String keyword;

  PhotoScreenState({
    this.isLoading = false,
    this.photos = const [],
    this.sortCategory = SortCategory.newest,
    this.keyword = '',
  });

  PhotoScreenState copyWith({
    bool? isLoading,
    List<Photo>? photos,
    SortCategory? sortCategory,
    String? keyword,
  }) {
    return PhotoScreenState(
      isLoading: isLoading ?? this.isLoading,
      photos: photos ?? this.photos,
      sortCategory: sortCategory ?? this.sortCategory,
      keyword: keyword ?? this.keyword,
    );
  }
}