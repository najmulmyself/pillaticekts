import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pillatickets/View/ticket.dart';

import 'home.dart';
import 'logout.dart';

class SuccessPage extends StatelessWidget {
  final String name;
  final String surname;
  final String ticketId;

  const SuccessPage({Key? key, required this.name, required this.surname, required this.ticketId})
      : super(key: key);

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
                      MaterialPageRoute(builder: (context) => Home(eventId: '',)));
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
              left: 80.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200.h,
                    width: 220.w,
                    decoration: BoxDecoration(
                      color: Color(0xFF4CCD38),
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150.h),
                              child: Icon(
                                Icons.check,
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
                    child: Text('Status: VÁLIDO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text('Name: $name ',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text('Surname: $surname',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text('Ticket ID: $ticketId',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
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
// class SuccessPage extends StatelessWidget {
//   final String name;
//   final String surname;
//   final String ticketId;
//   final String createdAt;
//   final String email;
//   final String mobile;
//   final String type;
//   final List<String> zones;
//
//   SuccessPage({
//     required this.name,
//     required this.surname,
//     required this.ticketId,
//     required this.createdAt,
//     required this.email,
//     required this.mobile,
//     required this.type,
//     required this.zones,
//   });
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
//                   'Ticket Scanned Successfully',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 24.h),
//                 Text(
//                   'Name: $name $surname',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                   ),
//                 ),
//                 SizedBox(height: 8.h),
//                 Text(
//                   'Ticket ID: $ticketId',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                   ),
//                 ),
//                 SizedBox(height: 8.h),
//                 Text(
//                   'Created At: $createdAt',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                   ),
//                 ),
//                 SizedBox(height: 8.h),
//                 Text(
//                   'Email: $email',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                   ),
//                 ),
//                 SizedBox(height: 8.h),
//                 Text(
//                   'Mobile: $mobile',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                   ),
//                 ),
//                 SizedBox(height: 8.h),
//                 Text(
//                   'Type: $type',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                   ),
//                 ),
//                 SizedBox(height: 8.h),
//                 Text(
//                   'Zones:',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                   ),
//                 ),
//                 SizedBox(height: 8.h),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: zones.length,
//                   itemBuilder: (context, index) {
//                     final zone = zones[index];
//                     return Text(
//                       '- $zone',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16.sp,
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

