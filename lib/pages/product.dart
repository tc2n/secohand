import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:secohand/components/launchWhatsApp.dart';
import 'package:secohand/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secohand/firebase_repository/firebase_repository.dart';

class ProductPage extends StatelessWidget {
  final PhoneInfo _phone;

  ProductPage(this._phone);

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
          '${_phone.company} ${_phone.model}'.toUpperCase(),
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
      body: SingleChildScrollView(
        child: Padding(
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
                        image: _phone.image==null ? AssetImage('images/placeholder.png') : NetworkImage(_phone.image),
                        fit: BoxFit.cover),
                  ),
                ),
                Text(
                  '₹ ${_phone.price}',
                  style: productPrice,
                ),

                Column(
                  children: [
                    Text(
                      'Details',
                      style: smallHead,
                    ),
                    SizedBox(height: 10,),
                    Table(
                      border: TableBorder(
                          top: BorderSide(color: primaryTransparent, width: 1),
                          bottom: BorderSide(color: primaryTransparent, width: 1),
                          right: BorderSide(color: primaryTransparent, width: 1),
                          left: BorderSide(color: primaryTransparent, width: 1),
                          verticalInside:
                              BorderSide(color: primaryTransparent, width: 1)),
                      children: [
                        createTableRow('Old', '${_phone.old} months old'),
                        createTableRow('RAM', '${_phone.ram} GB'),
                        createTableRow('Storage', '${_phone.memory} GB'),
                        createTableRow('Battery', '${_phone.battery} mAh'),
                        createTableRow(
                            'Charger Included?', _phone.charger ? 'Yes' : 'No'),
                        createTableRow('Screen condition', _phone.screen),
                      ],
                    ),
                  ],
                ),
                // Text(
                //   'Contact Seller',
                //   style: smallHead,
                // ),
                Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          launchCaller('7889428790');
                        },
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
                        onPressed: () {
                          try {
                            launchWhatsApp('+917889428790', 'Hello, I want to know about ${_phone.company} ${_phone.model} model id ${_phone.id.substring(16)}');
                          } catch (e) {
                            print(e);
                          }
                        },
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
