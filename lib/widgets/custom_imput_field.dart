import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

   final String? labelText;
   final String? hintText;
   final String? helperText;
   final IconData? icon;
   final IconData? suffixIcon;

  const CustomInputField({
    Key? key,

    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: '',
      onChanged: ( value ){
          print('value: $value');
      },
      validator: (value){
        if(value == null) return 'Este campo es requerido';
        return 'Este campo es requerido';
      },
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }
}