import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartgrid/Partials/Button/BackButton.dart';
import 'package:smartgrid/Partials/Button/BaseButton.dart';
import 'package:smartgrid/Partials/Form/formText.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController jabatanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 100.w),
                  child: KembaliButton(context, onTap: () {Navigator.pop(context);}),
                ),
                Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 73, 124, 1)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            CircleAvatar(
              radius: 70.dm,
              backgroundImage: AssetImage("assets/images/man_21.webp"),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bento", style: TextStyle(
                  color: Color.fromRGBO(0, 73, 124, 1),
                  fontFamily: "Lato",
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold
                ),),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit))
              ],
            ),
            SizedBox(height: 20.h,),
            //field email
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "EMAIL",
                    style: TextStyle(
                        color: Colors.grey, fontFamily: "Lato", fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  FormText(context, controller: emailController, label: "EMAIL"),
                ],
              ),
              SizedBox(
                    height: 10.h,
                  ),
            //field jabatan
      
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "JABATAN",
                    style: TextStyle(
                        color: Colors.grey, fontFamily: "Lato", fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  FormText(context, controller: jabatanController, label: "JABATAN"),
                ],
              ),
                SizedBox(
                    height: 60.h,
                  ),
               /*
                tombol untuk update profile
              */
              BaseButton(context,
                  height: 40.h,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Color.fromRGBO(2, 138, 234, 1),
                  fontColor: Colors.white,
                  label: "Simpan",
                  borderRadius: 10.dm, onTap: () {
                /*
                      function untuk simpan data di sini
                    */
                   
              }),
          ],
        ),
      ),
    );
  }
}
