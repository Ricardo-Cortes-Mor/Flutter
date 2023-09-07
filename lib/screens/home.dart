import 'package:app_holter/providers/name.dart';
import 'package:app_holter/widgets/input_txt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget{
    const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 

  @override
  Widget build(BuildContext context) {

    final miprovider = Provider.of<Name>(context);
    final Map <String, dynamic> datos ={
      'nombre':'---',
      'apellido':'---',
      'edad': 0
    };
    final GlobalKey <FormState> mykey= GlobalKey <FormState>();
    return Scaffold(
      // appBar: AppBar(
      //   leading: const Icon(Icons.favorite_rounded, color: Color.fromRGBO(229, 115, 115, 1),size: 50,),
      //   title: const Text('Monitor Holter',style: TextStyle(fontWeight: FontWeight.bold),),
        
      // ),
        
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            leading: const Icon(Icons.favorite_rounded, color: Color.fromRGBO(229, 115, 115, 1),size: 50,),
            floating: false,
            pinned: false,
            centerTitle: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.circular(21),
                child: const Image(image: AssetImage('assets/derivaciones.png'), fit: BoxFit.fill,) ),//AssetImage('assets/derivaciones.png')),
              title: const Text('Monitor Holter',style: TextStyle(fontWeight: FontWeight.bold),),
            )
          ),
          SliverList(
            delegate:  SliverChildListDelegate(
              [
                _inDate(mykey, datos, miprovider, context)
             ]         
           )
          )
        ],
      ),
    );
  }


  SingleChildScrollView _inDate(GlobalKey<FormState> mykey, Map<String, dynamic> datos, Name miprovider, BuildContext context) {
    return SingleChildScrollView(
        child: Form(
          key: mykey,
          child: Center(
            child: Column(
              children:  [
                 InputText(labelText: 'Nombre', icon:   Icons.account_circle_outlined, dat: 'nombre', mapdatos: datos,),
                  const SizedBox(height: 25,),
                 InputText(labelText: 'Apellido', icon: Icons.account_circle_rounded, dat: 'apellido', mapdatos: datos ),
                  const SizedBox(height: 25,),
                  InputText(labelText: 'Edad', icon: Icons.assignment_outlined, dat: 'edad', mapdatos: datos,),
                  const SizedBox(height: 35,),
                  //miprovider.name=datos['nombre'][0]+datos['apellido'][0]
    
    
                //   TextButton(
                //     onPressed: () => setState(() {
                //       miprovider.name=datos['nombre'][0]+datos['apellido'][0];
                //     }),
                //     child: const Text('Guardar')
                // ),
                Row(
                  children: [
                    const SizedBox(height: 400,width: 910,),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          miprovider.name = datos['nombre'][0]+datos['apellido'][0];
                          }
                        );
                        Navigator.pushNamed(context, 'blue',);
                    }, 
                    style: TextButton.styleFrom(
                     iconColor: Colors.blue[400],
                     foregroundColor: Colors.black87,
                     backgroundColor: Colors.white
                    ),
                    icon: const Icon(Icons.bluetooth_searching_outlined, size: 45, ),//color:Colors.blue[600]),
                    label:const  Text('Guargar información y conectar dispositivo.'),
                     
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}

// floatingActionButton: FloatingActionButton(
      //   onPressed: ()=> Navigator.pushNamed(context, 'blue',),
      //   elevation: 45,
      //   backgroundColor: Colors.white30,
      //   child:  Icon( Icons.bluetooth_searching_outlined, size: 35, color: Colors.blue[600],),
    // ),