import 'package:flutter_image_search_app/domain/model/photo.dart';
import 'package:flutter_image_search_app/domain/repository/photo_repository.dart';
import 'package:mockito/mockito.dart';

class MockPhotoRepositoryImpl extends Mock implements PhotoRepository {
  String q = '';

  @override
  Future<List<Photo>> getPhotos(String query) async {
    q = query;
    return _mockPhotos;
  }
}

List<Photo> _mockPhotos = [
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
