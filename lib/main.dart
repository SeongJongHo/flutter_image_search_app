import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_image_search_app/common/enum/profile_enum.dart';
import 'package:flutter_image_search_app/router/router.dart';

Future<void> main() async {
  await dotenv.load(fileName: getProfile());

  runApp(const MyApp());
}

String getProfile() {
  Profile profile =
      Profile.stringToProfile(Platform.environment['PROFILE'] ?? 'local');
  return profile.value;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Image Search',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
