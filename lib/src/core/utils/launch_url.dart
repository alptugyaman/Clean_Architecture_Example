import 'package:url_launcher/url_launcher.dart';

void launchURL(String _url) async {
  if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
}
