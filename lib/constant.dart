import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colors

Color background= Color(0xffeeeeee);
Color primary = Color(0xff732de3);
Color primaryTransparent = Color(0x33732de3);

Color iconCall = Color(0xff176BEF);
Color iconWhatsapp = Color(0xff179C52);
Color iconAdd = Color(0xffFF3E30);


//TextStyles
TextStyle appbar = GoogleFonts.roboto(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle chipHeading = GoogleFonts.nunito(color: primary, fontSize: 16, fontWeight: FontWeight.bold);
TextStyle chipText = GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal);
TextStyle mobileId = GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w400, color: primary);
TextStyle brandName = GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.bold);
TextStyle brandModel = GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.normal);
TextStyle brandAge = GoogleFonts.nunito(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 13);
TextStyle productPrice = GoogleFonts.nunito(color:primary, fontSize: 36, fontWeight: FontWeight.bold );
TextStyle smallHead = GoogleFonts.nunito(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600);
TextStyle tableHead = GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w600);
TextStyle tableContent = GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54 );
TextStyle typedText = GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w400);
TextStyle buttonText = GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w400, color: background, letterSpacing: 2.0 );


List<String> mobileBrands = ['Samsung', 'Apple', 'Nokia', 'Redmi', 'Xiaomi', 'mi', 'Micromax', 'Vivo', 'Oppo', 'Realme', 'Huawei', 'One Plus', 'google pixel', 'Jio phone', 'Other'];