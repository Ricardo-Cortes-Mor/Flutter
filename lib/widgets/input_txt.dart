import 'package:flutter/material.dart';

class InputText extends StatelessWidget{
  final String? labelText;
  final IconData? icon;
  final Map <String, dynamic> mapdatos;
  final String dat;

  const InputText({
    super.key,  
    this.labelText, 
    this.icon, 
    required this.mapdatos, 
    required this.dat,

    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.words,
        onChanged: (value) {
        mapdatos[dat]= value;
        },
        validator: (value) {
          if (value==null) return "Campo obligatorio";
          return  value.length <2 ? "Minimo tres caracteres" : null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration:  InputDecoration(
          icon:icon==null ? null : Icon(icon) ,
          labelText: labelText ?? '--', 
          contentPadding: const EdgeInsets.all(8)
        ),
      ); 
  }



}