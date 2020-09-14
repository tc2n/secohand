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

  Function get _onSelected => widget.onSelected;

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
            _onSelected(selected);
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

class MyFilterChipSingle extends StatefulWidget {
  final bool isSelected;
  final Function onSelected;
  final String label;

  MyFilterChipSingle({this.isSelected = false, this.onSelected, this.label});

  @override
  _MyFilterChipSingleState createState() => _MyFilterChipSingleState();
}

class _MyFilterChipSingleState extends State<MyFilterChipSingle> {

  Function get _onSelected => widget.onSelected;
  bool get _selectedChip => widget.isSelected;

  // bool _selected=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        label: Text(widget.label),
        labelStyle: chipText.copyWith(color: _selectedChip ? background : primary),
        selected: _selectedChip,
        onSelected: (bool selected){
          setState(() {
            _onSelected(selected);
            print(_selectedChip);
          });
        },
        backgroundColor: primaryTransparent,
        selectedColor: primary,
        checkmarkColor: background,
      ),
    );
  }
}
