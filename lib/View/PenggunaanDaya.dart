import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:smartgrid/Model/ChartData.dart';
import 'package:smartgrid/Model/RiwayatModel.dart';
import 'package:smartgrid/Partials/Button/BackButton.dart';
import 'package:smartgrid/Partials/Card/BaseCard.dart';

class PenggunaanDaya extends StatefulWidget {
  const PenggunaanDaya({Key? key}) : super(key: key);

  @override
  _PenggunaanDayaState createState() => _PenggunaanDayaState();
}

class _PenggunaanDayaState extends State<PenggunaanDaya> {
  final _numberOfPostsPerRequest = 10;

  final PagingController<int, RiwayatModel> _pagingController =
      PagingController(firstPageKey: 0);

  List<RiwayatModel> data_fake = [
    RiwayatModel(
        name1: "RE", name2: "PLN", value1: 30, value2: 8, date: "12/08/2024"),
    RiwayatModel(
        name1: "RE", name2: "PLN", value1: 30, value2: 8, date: "12/08/2024"),
    RiwayatModel(
        name1: "RE", name2: "PLN", value1: 30, value2: 8, date: "12/08/2024"),
  ];

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = await get(Uri.parse(
          "https://jsonplaceholder.typicode.com/posts?_page=$pageKey&_limit=$_numberOfPostsPerRequest"));
      List responseList = json.decode(response.body);
      List<RiwayatModel> postList = data_fake
          .map((data) => RiwayatModel(
              name1: data.name1,
              name2: data.name2,
              value1: data.value1,
              value2: data.value2))
          .toList();
      final isLastPage = postList.length < _numberOfPostsPerRequest;
      if (isLastPage) {
        _pagingController.appendLastPage(postList);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(postList, nextPageKey);
      }
    } catch (e) {
      print("error --> $e");
      _pagingController.error = e;
    }
  }

  List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 40.w),
                  child: KembaliButton(context, onTap: () {
                    Navigator.pop(context);
                  }),
                ),
                Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Penggunaan Daya",
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 73, 124, 1)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.dm),
                      bottomRight: Radius.circular(10.dm)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 0.4,
                        spreadRadius: 0.3,
                        offset: Offset(0, 1.2))
                  ],
                ),
                child: Padding(
                    padding: EdgeInsets.all(20.dm),
                    child: Container(child: LineChart(avgData())))),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.all(10.dm),
              child: Text(
                "Penggunaan Hari Ini",
                style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 16.sp,
                  color: Color.fromRGBO(0, 73, 124, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.dm),
              child: Text(
                "Riwayat Penggunaan",
                style: TextStyle(
                    color: Color.fromRGBO(0, 73, 124, 1),
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
        DraggableScrollableSheet(
            minChildSize: 0.4,
            initialChildSize: 0.4,
            maxChildSize: 0.6,
            builder: ((context, scrollController) {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white, // Adjust height as needed
                  child: ListView(controller: scrollController, children: [
                    Center(
                      child: BaseCard(
                        context,
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 0.9,
                        widget: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.87,
                            height: MediaQuery.of(context).size.height * 0.18,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.dm)),
                            child: Padding(
                              padding: EdgeInsets.all(20.dm),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Penggunaan RE",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 73, 124, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            fontFamily: "Lato"),
                                      ),
                                      Text(
                                        "30Kwh",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 73, 124, 1),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16.sp,
                                            fontFamily: "Lato"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Penggunaan PLN",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 73, 124, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            fontFamily: "Lato"),
                                      ),
                                      Text(
                                        "8Kwh",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 73, 124, 1),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16.sp,
                                            fontFamily: "Lato"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Presentase",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 73, 124, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            fontFamily: "Lato"),
                                      ),
                                      Text(
                                        "58%",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 73, 124, 1),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16.sp,
                                            fontFamily: "Lato"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 150.h,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.all(10.dm),
                        child: RefreshIndicator(
                          onRefresh: () =>
                              Future.sync(() => _pagingController.refresh()),
                          child: Flexible(
                            child: PagedListView<int, RiwayatModel>(
                              pagingController: _pagingController,
                              shrinkWrap:true,
                              builderDelegate:
                                  PagedChildBuilderDelegate<RiwayatModel>(
                                itemBuilder: (context, item, index) => Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: ListTile(
                                    leading: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(item.name1.toString()),
                                            Text(item.value1.toString()),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(item.name2.toString()),
                                            Text(item.value2.toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                    trailing: Text(item.date.toString()),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]));
            }))
      ]),
    );
  }
}
