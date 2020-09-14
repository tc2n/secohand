import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:secohand/components/launchWhatsApp.dart';
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

  List<String> phoneFilter = [];
  List<int> priceFilter = [];
  List<bool> selection = [false, false, false, false];
  int oldFilter;

  @override
  Widget build(BuildContext context) {
    Stream<List<PhoneInfo>> phoneStream =
        _phonesRepository.approvedPhones(phoneFilter, priceFilter, oldFilter);
    callStream() {
      setState(() {
        phoneStream = _phonesRepository.approvedPhones(
            phoneFilter, priceFilter, oldFilter);
      });
    }

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
        child: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: 10),
                      childrenPadding: EdgeInsets.symmetric(vertical: 10),
                      leading: Icon(FeatherIcons.filter),
                      title: Text('Filters', style: chipText),
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
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    MyFilterChip(
                                      onSelected: (value) {
                                        if (value) {
                                          priceFilter.add(0);
                                        } else {
                                          priceFilter.remove(0);
                                        }
                                        callStream();
                                      },
                                      label: 'Under ₹1000',
                                    ),
                                    MyFilterChip(
                                      onSelected: (value) {
                                        if (value) {
                                          priceFilter.add(12);
                                        } else {
                                          priceFilter.remove(12);
                                        }
                                        callStream();
                                      },
                                      label: '₹1000-₹2000',
                                    ),
                                    MyFilterChip(
                                      onSelected: (value) {
                                        if (value) {
                                          priceFilter.add(25);
                                        } else {
                                          priceFilter.remove(25);
                                        }
                                        callStream();
                                      },
                                      label: '₹2000-₹5000',
                                    ),
                                    MyFilterChip(
                                      onSelected: (value) {
                                        if (value) {
                                          priceFilter.add(510);
                                        } else {
                                          priceFilter.remove(510);
                                        }
                                        callStream();
                                      },
                                      label: '₹5000-₹10,000',
                                    ),
                                    MyFilterChip(
                                      onSelected: (value) {
                                        if (value) {
                                          priceFilter.add(10);
                                        } else {
                                          priceFilter.remove(10);
                                        }
                                        callStream();
                                      },
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
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    MyFilterChipSingle(
                                      isSelected: selection[0],
                                      onSelected: (value) {
                                        setState(() {
                                          selection = [
                                            value,
                                            false,
                                            false,
                                            false
                                          ];
                                        });
                                        if (value) {
                                          oldFilter = 6;
                                        } else {
                                          oldFilter = null;
                                        }
                                        callStream();
                                      },
                                      label: '< 6 months',
                                    ),
                                    MyFilterChipSingle(
                                      isSelected: selection[1],
                                      onSelected: (value) {
                                        setState(() {
                                          selection = [
                                            false,
                                            value,
                                            false,
                                            false
                                          ];
                                        });
                                        if (value) {
                                          oldFilter = 12;
                                        } else {
                                          oldFilter = null;
                                        }
                                        callStream();
                                      },
                                      label: '< 1 year',
                                    ),
                                    MyFilterChipSingle(
                                      isSelected: selection[2],
                                      onSelected: (value) {
                                        setState(() {
                                          selection = [
                                            false,
                                            false,
                                            value,
                                            false
                                          ];
                                        });
                                        if (value) {
                                          oldFilter = 24;
                                        } else {
                                          oldFilter = null;
                                        }
                                        callStream();
                                      },
                                      label: '< 2 years',
                                    ),
                                    MyFilterChipSingle(
                                      isSelected: selection[3],
                                      onSelected: (value) {
                                        setState(() {
                                          selection = [
                                            false,
                                            false,
                                            false,
                                            value
                                          ];
                                        });
                                        if (value) {
                                          oldFilter = 60;
                                        } else {
                                          oldFilter = null;
                                        }
                                        callStream();
                                      },
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
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    MyFilterChip(
                                      onSelected: (value) {
                                        if (value) {
                                          phoneFilter.add('samsung');
                                        } else {
                                          phoneFilter.remove('samsung');
                                        }
                                        callStream();
                                      },
                                      label: 'Samsung',
                                    ),
                                    MyFilterChip(
                                      onSelected: (value) {
                                        if (value) {
                                          phoneFilter.add('vivo');
                                        } else {
                                          phoneFilter.remove('vivo');
                                        }
                                        callStream();
                                      },
                                      label: 'Vivo',
                                    ),
                                    MyFilterChip(
                                      onSelected: (value) {
                                        if (value) {
                                          phoneFilter.add('oppo');
                                        } else {
                                          phoneFilter.remove('oppo');
                                        }
                                        callStream();
                                      },
                                      label: 'Oppo',
                                    ),
                                    MyFilterChip(
                                      onSelected: (value) {
                                        if (value) {
                                          phoneFilter.add('redmi');
                                        } else {
                                          phoneFilter.remove('redmi');
                                        }
                                        callStream();
                                      },
                                      label: 'Redmi',
                                    ),
                                    MyFilterChip(
                                      onSelected: (value) {
                                        if (value) {
                                          phoneFilter.add('huawei');
                                        } else {
                                          phoneFilter.remove('huawei');
                                        }
                                        callStream();
                                      },
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
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Hero(
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
                        child: Text(
                          'SELL YOUR PHONE',
                          style: buttonText,
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                Expanded(
                  child: StreamBuilder<List<PhoneInfo>>(
                      stream: phoneStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<PhoneInfo>> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Some Error Occured',
                              style: smallHead,
                            ),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              final phone = snapshot.data[index];
                              return PhoneCard(
                                url: phone.image,
                                id: phone.id.substring(16),
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
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 75,
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
                          launchWhatsApp('+917889428790', 'Hello');
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
                          semanticsLabel: 'WhatsApp Logo'),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                    // Hero(
                    //   tag: 'button',
                    //   child: RawMaterialButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => SellYourPhone()),
                    //       );
                    //     },
                    //     constraints: BoxConstraints(),
                    //     elevation: 5.0,
                    //     fillColor: iconAdd,
                    //     child: Icon(
                    //       FeatherIcons.plus,
                    //       size: 25,
                    //       color: background,
                    //     ),
                    //     padding: EdgeInsets.all(15.0),
                    //     shape: CircleBorder(),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
