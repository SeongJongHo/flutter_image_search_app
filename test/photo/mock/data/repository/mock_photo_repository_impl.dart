import 'package:flutter_image_search_app/data/dto/photo_result_dto.dart';
import 'package:flutter_image_search_app/domain/model/photo.dart';
import 'package:flutter_image_search_app/domain/repository/photo_repository.dart';
import 'package:mockito/mockito.dart';

class MockPhotoRepositoryImpl extends Mock implements PhotoRepository {
  @override
  Future<List<Photo>> getPhotos(String query) async => super.noSuchMethod(
        Invocation.getter(#getPhotos),
        returnValue: [
          HitDto(
            id: 1,
            pageURL: 'pageURL',
            type: 'type',
            tags: 'tags',
            previewURL: 'previewURL',
            previewWidth: 1,
            previewHeight: 1,
            webformatURL: 'webformatURL',
            webformatWidth: 1,
            webformatHeight: 1,
          ),
        ],
      );
}
