import 'package:flutter/material.dart';
import 'package:lifeshare/constant.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> data;
  final String selectedDropdownValue;
  final Function onChanged;
  final bool isTranslate;
  final String title;
  const CustomDropDown(
      {@required this.data,
      @required this.selectedDropdownValue,
      @required this.onChanged,
      @required this.title,
      this.isTranslate = false});

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          SizedBox(
            child: InputDecorator(
                decoration: const InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    focusColor: kPrimaryColor,
                    value: widget.selectedDropdownValue,
                    hint: Text('Select'),
                    isExpanded: true,
                    onChanged: widget.onChanged,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: kPrimaryColor,
                      size: 24,
                    ),
                    iconSize: 24,
                    items: widget.data
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child:
                                widget.isTranslate ? Text(value) : Text(value),
                          );
                        })
                        .toSet()
                        .toList(),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
