import 'package:url_launcher/url_launcher.dart';

void launchWhatsApp(String phone, String message) async {
  String url() {
      return "whatsapp://send?phone=$phone&text=${Uri.parse(message)}";
  }

  try {
    await launch(url());
  } catch(e) {
     print('Could not launch ${url()} due to $e');
  }
}


void launchCaller(String phone) async {
    String url(){return  "tel:$phone";}   
    try{
       await launch(url());
    } catch(e) {
      print('Could not launch $url');
    }   
}