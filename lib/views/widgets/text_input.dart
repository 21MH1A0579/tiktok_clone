import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
class TextInputFeild extends StatelessWidget {
  TextEditingController controller=TextEditingController();
  final String labeltext;
  final IconData icon;
  bool isObscure;
   TextInputFeild({
    super.key,
     required this.controller,
    required this.labeltext,
    required this.icon,
     this.isObscure=false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labeltext,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide:const BorderSide(
            color: borderColor
          )
        ),
        focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: borderColor
            )
        ) ,

      ),
      obscureText: isObscure,
    );
  }
}
