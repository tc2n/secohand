import 'package:url_launcher/url_launcher.dart';

void launchWhatsApp(String phone, String message) async {
  String url() {
      return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
  }

  if (await canLaunch(url())) {
    await launch(url());
  } else {
    throw 'Could not launch ${url()}';
  }
}


void launchCaller(String phone) async {
    String url(){return  "tel:$phone";}   
    if (await canLaunch(url())) {
       await launch(url());
    } else {
      throw 'Could not launch $url';
    }   
}