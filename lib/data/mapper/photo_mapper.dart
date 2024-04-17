import 'package:flutter_image_search_app/data/dto/photo_result_dto.dart';
import 'package:flutter_image_search_app/domain/model/photo.dart';

extension ToPhoto on HitDto {
  Photo toPhoto() {
    return Photo(
      id: id ?? 0,
      pageURL: pageURL ?? '',
      type: type ?? '',
      tags: tags ?? '',
      previewURL: previewURL ?? '',
      previewWidth: previewWidth ?? 0,
      previewHeight: previewHeight ?? 0,
      webformatURL: webformatURL ?? '',
      webformatWidth: webformatWidth ?? 0,
      webformatHeight: webformatHeight ?? 0,
      largeImageURL: largeImageURL ?? '',
      imageWidth: imageWidth ?? 0,
      imageHeight: imageHeight ?? 0,
      imageSize: imageSize ?? 0,
      views: views ?? 0,
      downloads: downloads ?? 0,
      collections: collections ?? 0,
      likes: likes ?? 0,
      comments: comments ?? 0,
      userId: userId ?? 0,
      user: user ?? '',
      userImageURL: userImageURL ?? '',
    );
  }
}
