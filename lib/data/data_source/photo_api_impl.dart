import 'dart:convert';

import 'package:flutter_image_search_app/common/config/pixabay_config.dart';
import 'package:flutter_image_search_app/common/util/http_util.dart';
import 'package:flutter_image_search_app/data/data_source/photo_api.dart';
import 'package:flutter_image_search_app/data/dto/photo_result_dto.dart';

class PhotoApiImpl implements PhotoApi {
  final HttpUtil _http;

  PhotoApiImpl({required HttpUtil http}) : _http = http;

  @override
  Future<PhotoResultDto> getPhotos(String query) async {
    final response = await _http.get(
        url: '${PixabayConfig.pixabayUrl}?key=${PixabayConfig.apiKey}'
            '&q=$query&image_type=photo');
    if (response.statusCode != 200) throw Exception('Failed to get photos');
    return PhotoResultDto.fromJson(jsonDecode(response.body));
  }
}
