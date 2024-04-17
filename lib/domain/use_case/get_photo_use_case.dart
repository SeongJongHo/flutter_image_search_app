import 'package:flutter_image_search_app/common/enum/sort_category_enum.dart';
import 'package:flutter_image_search_app/domain/model/photo.dart';

abstract interface class GetPhotoUseCase {
  Future<List<Photo>> execute(String keyword, {SortCategory? sortCategory});
}
