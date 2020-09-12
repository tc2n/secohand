import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:secohand/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Center(
            child: Text(
          'SAMSUNG GALAXY M30',
          style: appbar,
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Icon(
            FeatherIcons.plus,
            color: background,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black26,
                  image: DecorationImage(
                      image: AssetImage('images/samsung.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              Text(
                '₹ 5000',
                style: productPrice,
              ),
              Text(
                'Details',
                style: smallHead,
              ),
              Table(
                border: TableBorder(
                    top: BorderSide(color: primaryTransparent, width: 1),
                    bottom: BorderSide(color: primaryTransparent, width: 1),
                    right: BorderSide(color: primaryTransparent, width: 1),
                    left: BorderSide(color: primaryTransparent, width: 1),
                    verticalInside:
                        BorderSide(color: primaryTransparent, width: 1)),
                children: [
                  createTableRow('Old', '9 months ols'),
                  createTableRow('RAM', '3 GB'),
                  createTableRow('Storage', '32 GB'),
                  createTableRow('Battery', '5000 mAh'),
                  createTableRow('Charger Included?', 'Yes'),
                  createTableRow('Screen condition', 'good'),
                ],
              ),
              Text(
                'Contact Seller',
                style: smallHead,
              ),
              Container(
                
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    constraints: BoxConstraints(),
                    elevation: 5.0,
                    fillColor: iconCall,
                    child: Icon(
                      FeatherIcons.phone,
                      size: 25,
                      color: background,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    constraints: BoxConstraints(),
                    elevation: 5.0,
                    fillColor: iconWhatsapp,
                    child: SvgPicture.asset('images/whatsapp.svg',
                    height: 25,
                    width: 25,
                    color: background,
                        semanticsLabel: 'Whatsapp Logo'),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                ],
              ),
            
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TableRow createTableRow(String heading, String data) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        heading,
        style: tableHead,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        data,
        style: tableContent,
      ),
    )
  ]);
}
