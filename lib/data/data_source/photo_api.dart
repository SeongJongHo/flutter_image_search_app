import 'package:flutter_image_search_app/data/dto/photo_result_dto.dart';

abstract interface class PhotoApi {
  Future<PhotoResultDto> getPhotos(String query);
}
