import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:secohand/components/launchWhatsApp.dart';
import 'package:secohand/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secohand/firebase_repository/firebase_repository.dart';

import 'imageBig.dart';

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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_phone.image != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return ImageBig(tag: 'imagebig', url: _phone.image);
                          }));
                        }
                      },
                      child: Hero(
                        tag: 'imagebig',
                        child: Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black26,
                            image: DecorationImage(
                                image: _phone.image == null
                                    ? AssetImage('images/placeholder.png')
                                    : NetworkImage(_phone.image),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      '₹ ${_phone.price}',
                      style: productPrice,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      children: [
                        Text(
                          'Details',
                          style: smallHead,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Table(
                          border: TableBorder(
                              top: BorderSide(
                                  color: primaryTransparent, width: 1),
                              bottom: BorderSide(
                                  color: primaryTransparent, width: 1),
                              right: BorderSide(
                                  color: primaryTransparent, width: 1),
                              left: BorderSide(
                                  color: primaryTransparent, width: 1),
                              verticalInside: BorderSide(
                                  color: primaryTransparent, width: 1)),
                          children: [
                            createTableRow(
                                    'Old', '${_phone.old} months old'),
                                createTableRow('RAM', _phone.ram!=null ?'${_phone.ram} GB': "Not mentioned"),
                                createTableRow(
                                    'Storage', _phone.memory!=null ?'${_phone.memory} GB': "Not mentioned"),
                                createTableRow(
                                    'Battery', _phone.memory!=null ?'${_phone.battery} mAh': "Not mentioned"),
                                createTableRow('Charger Included?',
                                    _phone.charger==null ? 'Not mentioned':_phone.charger ? 'Yes' : 'No'),
                            createTableRow('Screen condition', _phone.screen),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      launchCaller('8770890130');
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
                        launchWhatsApp('+918770890130',
                            'Hello Kunal, I want to know about ${_phone.company} ${_phone.model}, model id ${_phone.id.substring(16)}');
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
          )
        ],
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
