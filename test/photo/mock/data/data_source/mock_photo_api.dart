import 'package:flutter_image_search_app/data/data_source/photo_api.dart';
import 'package:flutter_image_search_app/data/dto/photo_result_dto.dart';
import 'package:mockito/mockito.dart';

class MockPhotoApiImpl extends Mock implements PhotoApi {
  @override
  Future<PhotoResultDto> getPhotos(String query) async => super.noSuchMethod(
        Invocation.getter(#getPhotos),
        returnValue: PhotoResultDto(total: 500, totalHitDto: 20, hits: [
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
        ]),
      );
}
