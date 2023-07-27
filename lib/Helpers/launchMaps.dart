import 'package:url_launcher/url_launcher.dart';
// import 'package:external_app_launcher/external_app_launcher.dart';
import 'dart:io';

launchMap(String lat, String lon) async {
  // final double lat = 37.4221;
  // final double lon = -122.0841;

  final url = "https://www.google.com/maps/search/?api=1&query=$lat,$lon";

  if (Platform.isAndroid) {
    //  await launchUrl(Uri.parse(url));
    final packageName = "com.google.android.apps.maps";
    try {
      // LaunchApp.openApp(androidPackageName: packageName);
      await launchUrl(Uri.parse(url));
    } catch (e) {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        // throw 'Could not launch Google Maps.';
      }
    }
  } else if (Platform.isIOS) {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      // throw 'Could not launch Google Maps.';
    }
  }
}
