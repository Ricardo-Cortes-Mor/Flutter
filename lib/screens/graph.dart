//import 'dart:math';
import 'dart:io';
import 'package:app_holter/providers/name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:flutter/services.dart' show rootBundle;
//import 'package:syncfusion_flutter_charts/sparkcharts.dart';


class Graph extends StatefulWidget{
  
  
  
  const Graph({
  super.key, 
  
  });

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  late List <EcgData> _chartData;
  late ZoomPanBehavior _zoomPanBehavior;
  @override

  void initState(){
    _chartData=getChartData();
    _zoomPanBehavior = ZoomPanBehavior(
      //enablePinching: true,
      enableDoubleTapZooming: true,
      enableSelectionZooming: true,
      selectionRectBorderColor: Colors.red[200],
      selectionRectBorderWidth: 2,
      selectionRectColor: Colors.grey,
      enableMouseWheelZooming: true,
      
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final miprovider=Provider.of<Name>(context);
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          title: const  Text('Gráfica.'),
          
          actions: [
              Container(
                  margin: const EdgeInsets.only(right: 5), //margin configura el espacio externo 
                  child:  CircleAvatar(
                    backgroundColor:const Color.fromARGB(255, 193, 189, 190),
                    child:  Text(miprovider.name),
                  ),
              )
            ],
          ),

        body: SfCartesianChart(
            title: ChartTitle(text: 'ECG'),
            legend: Legend(isVisible: true),
            zoomPanBehavior: _zoomPanBehavior,
 
            // axes: <ChartAxis>[
            //        NumericAxis(
            //         //numberFormat: NumberFormat.compact(),
            //         majorGridLines: const MajorGridLines(width: 0.5),
            //         opposedPosition: true,
            //         name: 'yAxis',
            //         interval: 10,
            //         minimum: -100,
            //         maximum: 170)
            //     ],
            
            series: <ChartSeries>[
              LineSeries <EcgData,double> (
              name: 'ECG',
              dataSource: _chartData, 
              xValueMapper: (EcgData ecg, _) => ecg.x, 
              yValueMapper: (EcgData ecg, _) => ecg.y,
              //dataLabelSettings: const DataLabelSettings(isVisible: true) Sirve para visualizar los puntos
              )
              
            ],
            primaryXAxis: NumericAxis(
              title: AxisTitle(text: 'Tiempo [s]'),
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              interval:0.002,
              minimum: 0,
              maximum: 10,
              interactiveTooltip: const InteractiveTooltip(enable: false)
              //placeLabelsNearAxisLine: false
              //crossesAt: 0
              //majorGridLines: const MajorGridLines(width: 0)
              
              ),
          
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: 'Amplitud [uV]'),
              //placeLabelsNearAxisLine: false,
              interval:0.5,
              minimum: -350,
              maximum: 700,
              interactiveTooltip: const InteractiveTooltip(enable: false)
              // majorGridLines: const MajorGridLines(
              //   width: 0.8,
              //   color: Colors.blue
              // )
              //crossesAt: 0,
              //anchorRangeToVisiblePoints: false
              //majorGridLines: const MajorGridLines(width: 0.8)
              //labelFormat: '{}uV'
            ),
        ),
      ),
    );
  }

void readFileSync(List <EcgData> chartData) {
     List <String> contents =  File('data/testing_ecg.txt').readAsStringSync().split(' ');
     for  ( int t = 0; t < 5000; t++){
     chartData.add( EcgData(t*0.002, double.parse(contents[t*12+4]) ));
  }
 }


List<EcgData> getChartData(){

  List <EcgData> chartData=[];  
  readFileSync(chartData);
  return chartData;
      //List <EcgData> chartData=[];
        // for  ( int t = 0; t < 1000; t++){
        //   chartData.add(EcgData(t*1.0, Random().nextDouble()));
        // }
  }
}

class EcgData{

  EcgData(this.x,this.y);
  final double x;
  final double y;

}