import 'package:app_holter/providers/name.dart';
import 'package:flutter/material.dart';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';

class Blue extends StatefulWidget {
  Blue({super.key,  });

  //final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  final List<BluetoothDevice> devicesList = <BluetoothDevice>[];
  final Map<Guid, List<int>> readValues = <Guid, List<int>>{};
  @override
  State<Blue> createState() => _BlueState();
}

class _BlueState extends State<Blue> {

  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final miprovider= Provider.of<Name>(context);


    return   Scaffold(
      appBar: AppBar(),
      body:    Center(

        child: Text(miprovider.name.toString()),
        //setState(() { },)  
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'graph', ),
        backgroundColor: Colors.white12,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),) ,
        elevation: 35,
        child:  Icon(Icons.moving_sharp, size: 35,color: Colors.blue[600],),
        )
    );
   
  }
}