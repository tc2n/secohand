import 'package:flutter/material.dart';
import 'package:secohand/constant.dart';
import 'package:secohand/components/filterChip.dart';

class FindYourPhone extends StatefulWidget {
  @override
  _FindYourPhoneState createState() => _FindYourPhoneState();
}

class _FindYourPhoneState extends State<FindYourPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Center(
            child: Text(
          'FIND YOUR PHONE',
          style: appbar,
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                              label: '₹Oppo',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: 'Redmi',
                            ),
                            MyFilterChip(
                              onSelected: null,
                              label: 'Huwaie',
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
      ),
    );
  }
}
