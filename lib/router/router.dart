import 'package:flutter_image_search_app/common/util/http_util.dart';
import 'package:flutter_image_search_app/data/data_source/photo_api_impl.dart';
import 'package:flutter_image_search_app/data/repository/photo_repository_impl.dart';
import 'package:flutter_image_search_app/domain/use_case/get_photo_use_case.dart';
import 'package:flutter_image_search_app/domain/use_case/get_photo_use_case_impl.dart';
import 'package:flutter_image_search_app/presentation/page/photo_screen.dart';
import 'package:flutter_image_search_app/presentation/view_model/photo_screen_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => PhotoScreenViewModel(
            getPhotoUseCase: GetPhotoUseCaseImpl(
              photoRepository: PhotoRepositoryImpl(
                photoApi: PhotoApiImpl(
                  http: HttpUtil(),
                ),
              ),
            ),
          ),
          child: PhotoScreen(),
        );
      },
    ),
  ],
);
