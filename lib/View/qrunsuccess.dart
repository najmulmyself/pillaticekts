import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pillatickets/View/scan.dart';
import 'package:pillatickets/View/ticket.dart';
import 'home.dart';
import 'logout.dart';

class FailurePage extends StatelessWidget {
  final String zoneId;
  FailurePage({required this.zoneId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF24292E),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 55.h,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF002E3D),
              child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "     ESCANEAR TICKET",
                    style: TextStyle(
                      color: Color(0xFFF4F4F4),
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            //Column Bar
            Container(
              height: MediaQuery.of(context).size.height,
              width: 70.w,
              color: Color.fromRGBO(0, 0, 0, 0.15),
            ),

            //Column icons
            Positioned(
              top: 0.h,
              left: 10.w,
              child: Container(
                height: 55.h,
                width: 50.w,
                child: Image.asset(
                  'assets/images/thunder.png',
                  width: 200.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Positioned(
              top: 70.h,
              left: 0.w,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home(eventId: '',)));
                },
                child: Container(
                  height: 70.h,
                  width: 70.w,
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/home.png',
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Positioned(
              top: 160.h,
              left: 0.w,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Scan(zoneId: zoneId, eventId: '',)));
                },
                child: Container(
                  height: 70.h,
                  width: 70.w,
                  color: Color(0xFFB0C756),
                  child: Image.asset(
                    'assets/images/scan.png',
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Positioned(
              top: 250.h,
              left: 0.w,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Ticket(eventId: '',)));
                },
                child: Container(
                  height: 70.h,
                  width: 70.w,
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/ticket.png',
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Positioned(
              top: 340.h,
              left: 0.w,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Logout(eventId: '', zoneId: '',)));
                },
                child: Container(
                  height: 70.h,
                  width: 70.w,
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/logout.png',
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 120.h,
              left: 100.w,
              child: Column(
                children: [
                  Container(
                    height: 200.h,
                    width: 220.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFEA2D2D),
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150.h),
                              child: Icon(
                                Icons.close,
                                color: Color(0xFF24292E),
                                size: 150.0.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    child: Text('Status: INVÁLIDO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class FailurePage extends StatelessWidget {
//   final String zoneId;
//
//   FailurePage({required this.zoneId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF24292E),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Failed to Scan Ticket',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 24.h),
//                 Text(
//                   'Ticket ID: Not Available',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
