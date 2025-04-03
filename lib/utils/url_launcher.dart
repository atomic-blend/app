import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncher {
  static Future<void> launchUrl(String url) async {
    if (!await launchUrlString(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
