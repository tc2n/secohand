import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:secohand/constant.dart';

class PhoneCard extends StatelessWidget {

  final String url;
  final String phoneBrand;
  final String phoneModel;
  final int price;
  final int monthsOld;

  PhoneCard({this.url, this.phoneBrand, this.phoneModel, this.price, this.monthsOld});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 27.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                1.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black26,
                  image: DecorationImage(
                      image: AssetImage(url), fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(phoneBrand, style: brandName,),
                  Text(phoneModel, style: brandModel,),
                  Expanded(child: SizedBox()),
                  Text('$monthsOld months old', style: brandAge,),
                  Text('₹$price', style: brandName,),
                ],
              ),
            ),
            Expanded(child: Icon(FeatherIcons.arrowRight, color: primary, size: 35,)),
          ],
        ),
      ),
    );
  }
}
