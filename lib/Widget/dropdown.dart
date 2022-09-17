import 'package:flutter/material.dart';
import 'package:ijarah/constant.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({required this.onChanged, required this.items});

  Function onChanged;
  List<String> items;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      //   width: width(context) * 20,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primaryColor,
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(0, 5), blurRadius: 15)
          ]),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          dropdownColor: primaryColor,
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
          ),
          value: widget.items[selectedIndex],
          items: widget.items.map(buildMenuItem).toList(),
          onChanged: (value) {
            widget.onChanged(value);
            setState(() {
              selectedIndex = widget.items.indexOf(value.toString());
            });
          },
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: FittedBox(
        child: Text(
          item,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'Poppins-thins',
          ),
        ),
      ),
    );
