import 'dart:convert';

import 'package:flutter_image_search_app/common/util/http_util.dart';
import 'package:flutter_image_search_app/data/dto/photo_result_dto.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockHttpUtil extends Mock implements HttpUtil {
  @override
  Future<http.Response> get(
          {required String url, Map<String, String>? headers}) async =>
      super.noSuchMethod(
        Invocation.getter(#get),
        returnValue: http.Response(
            jsonEncode(PhotoResultDto(total: 500, totalHitDto: 20, hits: [
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
            ]).toJson()),
            200),
      );
}
