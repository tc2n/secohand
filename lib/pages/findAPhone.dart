import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:secohand/components/phoneCard.dart';
import 'package:secohand/constant.dart';
import 'package:secohand/components/filterChip.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secohand/firebase_repository/firebase_repository.dart';
import 'package:secohand/pages/product.dart';
import 'package:secohand/pages/sellYourPhone.dart';

class FindAPhone extends StatefulWidget {
  @override
  _FindAPhoneState createState() => _FindAPhoneState();
}

class _FindAPhoneState extends State<FindAPhone> {
  final PhonesRepository _phonesRepository = FirebasePhoneRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Center(
            child: Text(
          'FIND A PHONE',
          style: appbar,
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Price',
                      style: chipHeading,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 36,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            MyFilterChip(
                              onSelected: null,
                              label: 'Under ₹1000',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: '₹1000-₹2000',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: '₹2000-₹5000',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: '₹5000-₹10,000',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: 'Over ₹10000',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Old',
                      style: chipHeading,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 36,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            MyFilterChip(
                              onSelected: null,
                              label: '< 6 months',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: '< 1 year',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: '< 2 years',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: '< 5 years',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Brands',
                      style: chipHeading,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 36,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            MyFilterChip(
                              onSelected: null,
                              label: 'Samsung',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: 'Vivo',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: 'Oppo',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: 'Redmi',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: 'Huawei',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ), //For Chips
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<List<PhoneInfo>>(
                  stream: _phonesRepository.approvedPhones(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<PhoneInfo>> snapshot) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          final phone = snapshot.data[index];
                          return PhoneCard(
                            url: 'images/pixel.jpg',
                            phoneBrand: phone.company,
                            phoneModel: phone.model,
                            monthsOld: phone.old,
                            price: phone.price,
                            onClick: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductPage(phone)));
                            },
                          );
                        });
                  }),

              // child: ListView(
              //   physics: BouncingScrollPhysics(),
              //   children: [
              //     PhoneCard(
              //       url: 'images/pixel.jpg',
              //       phoneBrand: 'Pixel',
              //       phoneModel: '4A',
              //       monthsOld: 18,
              //       price: 30000,
              //       onClick: onClick,
              //     ),
              //     PhoneCard(
              //       url: 'images/samsung.jpg',
              //       phoneBrand: 'Samsung',
              //       phoneModel: 'Galaxy M30',
              //       monthsOld: 3,
              //       price: 5000,
              //       onClick: onClick,
              //     ),
              //   ],
              // ),
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
                        semanticsLabel: 'WhatsApp Logo'),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  Hero(
                    tag: 'button',
                    child: RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SellYourPhone()),
                        );
                      },
                      constraints: BoxConstraints(),
                      elevation: 5.0,
                      fillColor: iconAdd,
                      child: Icon(
                        FeatherIcons.plus,
                        size: 25,
                        color: background,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
