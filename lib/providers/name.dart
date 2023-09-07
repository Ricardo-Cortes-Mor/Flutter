

import 'package:flutter/material.dart';

class Name with ChangeNotifier{
  String _name= '--';
 
  String get name => _name;

  set name (String iniciales){
    _name = iniciales;
    notifyListeners();
  }
}