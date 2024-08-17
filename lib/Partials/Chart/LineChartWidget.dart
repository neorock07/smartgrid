import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartgrid/Model/ChartData.dart';


class LineWidget{
LineWidget({
  this.arr_data
});

List<ChartData>? arr_data;

List<FlSpot> getSpotsPln(){
  return arr_data!.asMap().entries.map((e){
     int index = e.key;
     ChartData item = e.value;
     return FlSpot(index.toDouble(), item.pln); 
  }).toList();
}

List<FlSpot> getSpotsRe(){
  return arr_data!.asMap().entries.map((e){
     int index = e.key;
     ChartData item = e.value;
     return FlSpot(index.toDouble(), item.re); 
  }).toList();
}

Widget LineChartWidget(BuildContext context){
  return LineChart(
    LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              int index = value.toInt();
              if(index >= 0 && index < arr_data!.length){
                return Text(arr_data![index].date, style: TextStyle(
                  color: Colors.black, 
                  fontSize: 8.sp,
                  fontFamily: "Lato"
                ),);
              }
              return const Text('');
            },
          )
        )
      ),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: getSpotsPln(),
          isCurved: true, 
          barWidth: 3, 
          color: Colors.blue, 
        ),
        LineChartBarData(
          spots: getSpotsRe(),
          isCurved: true, 
          barWidth: 3, 
          color: Colors.green, 
        ),
      ]
    )
  ); 
}
}

