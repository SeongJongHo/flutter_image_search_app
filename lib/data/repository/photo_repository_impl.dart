import 'package:flutter_image_search_app/data/data_source/photo_api.dart';
import 'package:flutter_image_search_app/data/mapper/photo_mapper.dart';
import 'package:flutter_image_search_app/domain/model/photo.dart';
import 'package:flutter_image_search_app/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoApi _photoApi;

  PhotoRepositoryImpl({required PhotoApi photoApi}) : _photoApi = photoApi;

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final photoResultDto = await _photoApi.getPhotos(query);

    return photoResultDto.hits?.map((hit) => hit.toPhoto()).toList() ?? [];
  }
}
