import 'package:url_launcher/url_launcher.dart';

abstract class Urlhandler {
  void myUrlLuncher(String? paymentGatewayUri);
}

class MyUrlLuncher extends Urlhandler {
  @override
  void myUrlLuncher(String? paymentGatewayUri) {
    launchUrl(
      Uri.parse(paymentGatewayUri!),
      mode: LaunchMode.externalApplication,
    );
  }
}
