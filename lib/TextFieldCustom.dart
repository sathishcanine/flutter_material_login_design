import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCus extends StatelessWidget {
  final String? hintText,text;
  final TextEditingController? editingController;
  final String? typee;

  static const Color textFieldbgColor = const Color(0xFFF9F9F9);
  static const Color textFieldhintColor = const Color(0xFF6A6A6A);

  const TextFieldCus({ this.hintText,  this.text,  this.editingController, this.typee});

  @override
  Widget build(BuildContext context) {
    TextEditingController? _controller;
    var  keyType;
    var  length;

    if(typee=="2")
    {
      keyType =   TextInputType.phone;
      length = 11;
    } else if(typee=="4")
    {
      keyType =   TextInputType.emailAddress;
    }else{
      keyType =   TextInputType.text;
    }

    if (editingController!=null) {
      _controller = editingController!;
    } else {
      // _controller = null;
    }

    OutlineInputBorder outlineInputBorder =  const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 0.0),
    );
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: textFieldbgColor,
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0 , top: 5.0),
        child: TextFormField(
          keyboardType: keyType,
          controller: _controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 16.0, fontFamily: "Brandon", fontWeight: FontWeight.w400,color: textFieldhintColor,),
          ),
        ),
      ),
    );
  }
}