import 'package:http/http.dart' as http;

class HttpUtil {
  Future<http.Response> get(
      {required String url, Map<String, String>? headers}) async {
    return await http.get(Uri.parse(url), headers: headers);
  }
}
