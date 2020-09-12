import 'package:flutter/material.dart';
import 'package:secohand/constant.dart';

class MyFilterChip extends StatefulWidget {
  final bool isSelected;
  final Function onSelected;
  final String label;

  MyFilterChip({this.isSelected = false, this.onSelected, this.label});

  @override
  _MyFilterChipState createState() => _MyFilterChipState();
}

class _MyFilterChipState extends State<MyFilterChip> {
  bool _selected=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        label: Text(widget.label),
        labelStyle: chipText.copyWith(color: _selected ? background : primary),
        selected: _selected,
        onSelected: (bool selected){
          setState(() {
            _selected=!_selected;
            print(_selected);
          });
        },
        backgroundColor: primaryTransparent,
        selectedColor: primary,
        checkmarkColor: background,
      ),
    );
  }
}
