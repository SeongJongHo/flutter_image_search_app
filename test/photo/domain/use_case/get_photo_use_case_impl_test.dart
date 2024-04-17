import 'package:flutter_image_search_app/domain/model/photo.dart';
import 'package:flutter_image_search_app/domain/use_case/get_photo_use_case_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock/data/repository/mock_photo_repository_impl.dart';

void main() {
  group('GetPhotoUseCaseImpl 클래스', () {
    final MockPhotoRepositoryImpl mockPhotoRepositoryImpl =
        MockPhotoRepositoryImpl();
    final GetPhotoUseCaseImpl getPhotoUseCaseImpl =
        GetPhotoUseCaseImpl(photoRepository: mockPhotoRepositoryImpl);
    final List<Photo> photos = [
      Photo(
          id: 0,
          pageURL: '',
          type: '',
          tags: '',
          previewURL: '',
          previewWidth: 0,
          previewHeight: 0,
          webformatURL: '',
          webformatWidth: 0,
          webformatHeight: 0,
          largeImageURL: '',
          imageWidth: 0,
          imageHeight: 0,
          imageSize: 0,
          views: 0,
          downloads: 0,
          collections: 0,
          likes: 0,
          comments: 0,
          userId: 0,
          user: '',
          userImageURL: ''),
    ];
    setUp(() {
      mockPhotoRepositoryImpl.q = '';
    });
    group('execute 메소드는', () {
      test('정상적으로 데이터를 가져올 때 List<Photo>를 반환한다', () async {
        // given
        String query = 'test photo1';

        // when
        final actual = await getPhotoUseCaseImpl.execute(query);

        // then
        expect(actual.first, photos.first);
      });

      test('keyword 인자를 받아서 띄어쓰기를 +로 바꿔서 repository.getPhotos에 넘겨준다.',
          () async {
        // given
        String query = 'test photo';
        String expected = 'test+photo';

        // when
        final a = await getPhotoUseCaseImpl.execute(query);

        // then
        expect(mockPhotoRepositoryImpl.q, expected);
      });
    });
  });
}
