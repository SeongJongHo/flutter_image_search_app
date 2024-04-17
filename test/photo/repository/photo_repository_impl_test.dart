import 'package:flutter_image_search_app/data/dto/photo_result_dto.dart';
import 'package:flutter_image_search_app/data/repository/photo_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock/data/data_source/mock_photo_api.dart';

void main() {
  group('PhotoRepositoryImpl 클래스', () {
    final MockPhotoApiImpl mockPhotoApiImpl = MockPhotoApiImpl();
    final PhotoRepositoryImpl photoRepositoryImpl =
        PhotoRepositoryImpl(photoApi: mockPhotoApiImpl);
    final PhotoResultDto photoResultDto =
        PhotoResultDto(total: 500, totalHitDto: 20, hits: [
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
    ]);
    setUp(() {
      reset(mockPhotoApiImpl);
    });
    group('getPhotos 메소드는', () {
      test('정상적으로 데이터를 가져올 때 List<Photo>를 반환한다', () async {
        // given
        String query = 'test';
        when(mockPhotoApiImpl.getPhotos(query))
            .thenAnswer((_) async => photoResultDto);

        // when
        final actual = await photoRepositoryImpl.getPhotos(query);

        // then
        expect(actual.length, photoResultDto.hits!.length);
      });

      test('PhotoApiImpl.getPhotos를 한번 호출한다.', () async {
        // given
        String query = 'test';
        when(mockPhotoApiImpl.getPhotos(query))
            .thenAnswer((_) async => photoResultDto);

        // when
        final actual = photoRepositoryImpl.getPhotos(query);

        // then
        verify(mockPhotoApiImpl.getPhotos(query)).called(1);
      });
    });
  });
}
