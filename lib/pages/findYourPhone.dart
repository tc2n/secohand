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
                    //I am not able to make this thing scroll
                    /*
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                          MyFilterChip(onSelected: null, label: 'Under ₹1000',),
                          MyFilterChip(onSelected: null, label: '₹1000-₹2000',),
                          MyFilterChip(onSelected: null, label: '₹2000-₹5000',),
                          MyFilterChip(onSelected: null, label: '₹5000-₹10,000',),
                          MyFilterChip(onSelected: null, label: 'Over ₹10000',),
                      ],
                    ),*/
                    //This thing is not working
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
