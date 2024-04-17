import 'package:flutter_dotenv/flutter_dotenv.dart';

class PixabayConfig {
  static final String apiKey = dotenv.env['PIXABAY_API_KEY'].toString();
  static final String pixabayUrl = dotenv.env['PIXABAY_URL'].toString();

  _PixabayConfig() {}
}
