import 'package:flutter/material.dart';
import 'package:ijarah/constant.dart';

class InputFeild extends StatefulWidget {
  String hinntText;

  Function validatior;
  void Function(String?)? saved;
  void Function(String)? submitted;
  TextEditingController inputController;
  TextInputType? type;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  bool secure = true;
  IconData? suffix;
  bool readOnly;
  Function? suffixPress;
  int? maxLines;

  InputFeild(
      {required this.hinntText,
      required this.validatior,
      required this.inputController,
      this.type,
      this.focusNode,
      this.submitted,
      this.saved,
      this.suffix,
      this.maxLines = 1,
      this.suffixPress,
      this.textInputAction,
      this.readOnly = false,
      this.secure = false});

  @override
  State<InputFeild> createState() => _InputFeildState();
}

class _InputFeildState extends State<InputFeild> {
  var isError = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    if (height < 700) {
      height = 700 / 100;
    }
    return Container(
      height: isError ? height * 9 : height * 7,
      //   margin: EdgeInsets.only(top: height * 3),
      child: TextFormField(
        maxLines: widget.maxLines,
        onFieldSubmitted: widget.submitted,
        onSaved: widget.saved,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        obscureText: widget.secure,
        readOnly: widget.readOnly,
        keyboardType: widget.type,
        controller: widget.inputController,
        validator: (value) {
          var error = widget.validatior(value);
          if (error != null) {
            setState(() {
              isError = true;
            });
          } else {
            setState(() {
              isError = false;
            });
          }

          return error;
        },
        style: TextStyle(color: primaryColor),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              widget.suffix,
              color: Colors.white,
            ),
            onPressed: widget.suffixPress as Function()?,
          ),
          fillColor: primaryColor,
          // contentPadding: const EdgeInsets.all(5),
          hintStyle:
              TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 15),
          hintText: widget.hinntText,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          // OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   borderSide: const BorderSide(color: Colors.white, width: 2.0),
          // ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(168, 167, 167, 0.6),
            ),
          ),
          // OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   borderSide: const BorderSide(color: Colors.white, width: 2.0),
          // ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          //  OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   borderSide: const BorderSide(color: Colors.red, width: 2.0),
          // ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          // OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   borderSide: const BorderSide(color: Colors.red, width: 2.0),
          // ),
          errorStyle: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.red,
                fontSize: 11,
              ),
        ),
      ),
    );
  }
}
