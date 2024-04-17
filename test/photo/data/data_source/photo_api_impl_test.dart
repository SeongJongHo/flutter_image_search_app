import 'dart:convert';

import 'package:flutter_image_search_app/data/data_source/photo_api_impl.dart';
import 'package:flutter_image_search_app/data/dto/photo_result_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../mock/common/mock_http_util.dart';


void main() {
  group('PhotoApiImpl 클래스', () {
    final MockHttpUtil mockHttpUtil = MockHttpUtil();
    final PhotoApiImpl photoApiImpl = PhotoApiImpl(http: mockHttpUtil);
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
      reset(mockHttpUtil);
    });
    group('getPhotos 메소드는', () {
      test('정상적으로 데이터를 가져올 때 PhotoResultDto를 반환한다', () async {
        // given
        String query = 'test';
        when(mockHttpUtil.get(url: query)).thenAnswer((_) async =>
            http.Response(jsonEncode(photoResultDto.toJson()), 200));

        // when
        final actual = await photoApiImpl.getPhotos(query);

        // then
        expect(actual.total, photoResultDto.total);
        expect(actual.totalHitDto, photoResultDto.totalHitDto);
        expect(actual.hits!.length, photoResultDto.hits!.length);
      });

      test('데이터를 가져오지 못할 때 Exception을 던진다', () async {
        // given
        String query = 'test';
        when(mockHttpUtil.get(url: query))
            .thenAnswer((_) async => http.Response('', 400));

        // when
        final actual = photoApiImpl.getPhotos(query);

        // then
        expect(actual, throwsException);
      });
    });
  });
}
