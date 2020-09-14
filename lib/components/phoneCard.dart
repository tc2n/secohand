import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:secohand/constant.dart';

class PhoneCard extends StatelessWidget {

  final String url;
  final String id;
  final String phoneBrand;
  final String phoneModel;
  final int price;
  final int monthsOld;
  final Function onClick;

  PhoneCard({this.url, this.id, this.phoneBrand, this.phoneModel, this.price, this.monthsOld, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
          child: Padding(
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
                        image: url==null ? AssetImage('images/placeholder.png') : NetworkImage(url), fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: $id', style: mobileId,),
                    Text(phoneBrand.toUpperCase(), style: brandName,),
                    Text(phoneModel.toUpperCase(), style: brandModel,),
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
      ),
    );
  }
}
