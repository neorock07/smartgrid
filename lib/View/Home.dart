import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartgrid/Partials/Card/CardMode.dart';
import 'package:smartgrid/Partials/Card/DashboardCard.dart';
import 'package:smartgrid/View/ListEnergy.dart';
import 'package:smartgrid/View/ListPLN.dart';
import 'package:smartgrid/View/Pengaturan.dart';
import 'package:smartgrid/View/PengeluaranBiaya.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/man_21.webp"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bento",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 73, 124, 1),
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                      Text(
                        "Tetap semangat, Bento!",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 73, 124, 1),
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            fontSize: 16.sp),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Pengaturan()));
                      },
                      icon: Icon(
                        LucideIcons.settings,
                        color: Color.fromRGBO(0, 73, 124, 1),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            /** 
             * 
             *card untuk menampilkan mode di home , 
             note: onRefresh if refreshed icon tapped
             */
            CardMode(context, mode: "Auto", onRefresh: () {}),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 73, 124, 1),
                      fontFamily: "Lato",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 160.dm,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.all(10.dm),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.dm),
                        child: DashboardCard(context,
                            label: "Penggunaan Daya Listrik",
                            icon: Icons.electric_bolt,
                            color: Colors.amber,
                            onTap: () {}),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.dm),
                        child: DashboardCard(context,
                            label: "Pengeluaran Keuangan",
                            icon: LucideIcons.badgeDollarSign,
                            color: Colors.green,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PengeluaranBiaya()));
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.dm),
                        child: DashboardCard(context,
                            label: "Perkiraan Cuaca",
                            icon: LucideIcons.cloudSunRain,
                            color: Colors.blue,
                            onTap: () {}),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Monitoring Sumber Energi",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 73, 124, 1),
                      fontFamily: "Lato",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        DraggableScrollableSheet(
            minChildSize: 0.4,
            initialChildSize: 0.4,
            maxChildSize: 0.9,
            builder: (((context, scrollController) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 0.5,
                        offset: Offset(0, 0.5))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      child: TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(text: "Renewable Energy"),
                          Tab(text: "PLN"),
                        ],
                      ),
                    ),
                    Flexible(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                            controller: scrollController,
                            /**
                             * edit menampilkan data pada file ListEnergy.dart
                             */
                            child: ListEnergy(),
                          ),
                          /**
                             * edit menampilkan data pada file ListPLN.dart
                             */
                          SingleChildScrollView(
                            controller: scrollController,
                            child: ListPLN(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            })))
      ]),
    );
  }
}
