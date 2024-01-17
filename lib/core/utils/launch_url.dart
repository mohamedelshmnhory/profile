import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../features/profile/data/models/location.dart';

class LaunchUrl {
  static void makeACall(String phoneNumber) async {
    Uri url = Uri.parse('tel:$phoneNumber');
    if (!await launchUrl(url)) {
      throw 'Could not launch $phoneNumber';
    }
  }

  static void openUrl(String? link) async {
    if (link == null) return;
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $link';
    }
  }

  static Future<bool> openMap(Location latLng) async {
    String urlString = 'https://www.google.com/maps/search/?api=1&query=${latLng.latitude},${latLng.longitude}';
    if (!await canLaunchUrlString(urlString)) {
      throw Exception();
    }
    return await launchUrlString(urlString, mode: LaunchMode.externalApplication);
  }
}
