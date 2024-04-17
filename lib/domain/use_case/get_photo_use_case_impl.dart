import 'package:collection/collection.dart';
import 'package:flutter_image_search_app/common/enum/sort_category_enum.dart';
import 'package:flutter_image_search_app/domain/model/photo.dart';
import 'package:flutter_image_search_app/domain/repository/photo_repository.dart';
import 'package:flutter_image_search_app/domain/use_case/get_photo_use_case.dart';

class GetPhotoUseCaseImpl implements GetPhotoUseCase {
  final PhotoRepository _photoRepository;

  GetPhotoUseCaseImpl({required PhotoRepository photoRepository})
      : _photoRepository = photoRepository;

  @override
  Future<List<Photo>> execute(String keyword,
      {SortCategory? sortCategory}) async {
    String query = keyword.replaceAll(' ', '+');
    return await switch (sortCategory ?? SortCategory.newest) {
      SortCategory.newest => _getSortedNewPhotos(query),
      SortCategory.popularity => _getSortedPopularPhotos(query),
      SortCategory.oldest => _getSortedOldPhotos(query),
    };
  }

  Future<List<Photo>> _getSortedNewPhotos(String query) async {
    final photos = await _photoRepository.getPhotos(query);

    return photos.sorted((a, b) => b.id.compareTo(a.id));
  }

  Future<List<Photo>> _getSortedPopularPhotos(String query) async {
    final photos = await _photoRepository.getPhotos(query);

    return photos.sorted((a, b) => b.likes.compareTo(a.likes));
  }

  Future<List<Photo>> _getSortedOldPhotos(String query) async {
    final photos = await _photoRepository.getPhotos(query);

    return photos.sorted((a, b) => a.id.compareTo(b.id));
  }
}
