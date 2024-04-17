import 'package:flutter/material.dart';
import 'package:flutter_image_search_app/common/enum/sort_category_enum.dart';
import 'package:flutter_image_search_app/presentation/view_model/photo_screen_view_model.dart';
import 'package:provider/provider.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(initViewModel);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> initViewModel() async {
    final viewModel = context.read<PhotoScreenViewModel>();
    await viewModel.search();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Search'),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: '이미지 검색',
                      ),
                      onFieldSubmitted: (value) {
                        viewModel.search(keyword: controller.text);
                      },
                    ),
                  ),
                  SizedBox(
                    child: IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        viewModel.search(keyword: controller.text);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  RadioMenuButton(
                    groupValue: viewModel.state.sortCategory,
                    value: SortCategory.newest,
                    onChanged: (value) {
                      viewModel.changeSortCategory(value);
                      setState(() {
                      });
                    },
                    child: Text(SortCategory.newest.value),
                  ),
                  RadioMenuButton(
                    groupValue: viewModel.state.sortCategory,
                    value: SortCategory.oldest,
                    onChanged: (value) {
                      viewModel.changeSortCategory(value);
                    },
                    child: Text(SortCategory.oldest.value),
                  ),
                  RadioMenuButton(
                    groupValue: viewModel.state.sortCategory,
                    value: SortCategory.popularity,
                    onChanged: (value) {
                      viewModel.changeSortCategory(value);
                    },
                    child: Text(SortCategory.popularity.value),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<PhotoScreenViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: viewModel.state.photos.length,
                    itemBuilder: (context, index) {
                      final photo = viewModel.state.photos[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                            image: NetworkImage(photo.previewURL),
                            fit: BoxFit.cover),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  get viewModel => context.read<PhotoScreenViewModel>();
}
