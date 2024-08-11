import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smartgrid/Partials/Card/CardMode.dart';
import 'package:smartgrid/Partials/Card/DashboardCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    onPressed: () {},
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
          SizedBox(
            height: 10.h,
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
                          color: Colors.amber),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.dm),
                      child: DashboardCard(context,
                          label: "Pengeluaran Keuangan",
                          icon: LucideIcons.badgeDollarSign,
                          color: Colors.green
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.dm),
                      child: DashboardCard(context,
                          label: "Perkiraan Cuaca",
                          icon: LucideIcons.cloudSunRain,
                          color: Colors.blue
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
