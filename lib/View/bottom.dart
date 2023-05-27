// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pillatickets/View/home.dart';
// import 'package:pillatickets/View/logout.dart';
// import 'package:pillatickets/View/scan.dart';
// import 'package:pillatickets/View/ticket.dart';
// import 'package:http/http.dart' as http;
//
// class Bar extends StatefulWidget {
//   final int eventId;
//
//   const Bar({Key? key, required this.eventId}) : super(key: key);
//
//   @override
//   State<Bar> createState() => _BarState();
// }
//
// class _BarState extends State<Bar> {
//   int bookedTickets = 0;
//   int scannedTickets = 0;
//   int remainingTickets = 0;
//
//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('http://jobfid.com/api/event-tickets-info/${widget.eventId}'));
//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       final data = jsonData['data'];
//       setState(() {
//         bookedTickets = data['booked'];
//         scannedTickets = data['scaned'];
//         remainingTickets = data['remaining'];
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF24292E),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             //App Bar
//             Container(
//               height: 55.h,
//               width: MediaQuery.of(context).size.width,
//               color: Color(0xFF002E3D),
//               child: Padding(
//                 padding: EdgeInsets.only(left: 16.w),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "      IN-EDIT CCS",
//                     style: TextStyle(
//                         color: Color(0xFFF4F4F4),
//                         fontSize: 25.sp,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Poppins'
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             //Column Bar
//             Container(
//               height: MediaQuery.of(context).size.height,
//               width: 70.w,
//               color: Color.fromRGBO(0, 0, 0, 0.15),
//             ),
//
//             //Column icons
//             Positioned(
//               top: 0.h,
//               left: 10.w,
//               child: Container(
//                 height: 55.h,
//                 width: 50.w,
//                 child: Image.asset(
//                   'assets/images/thunder.png',
//                   width: 200.w,
//                   height: 200.h,
//                   fit: BoxFit.cover,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             Positioned(
//               top: 70.h,
//               left: 0.w,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Home(bookedTickets: bookedTickets, scannedTickets: scannedTickets, remainingTickets: remainingTickets,)));
//                 },
//                 child: Container(
//                   height: 70.h,
//                   width: 70.w,
//                   color: Colors.white,
//                   child: Image.asset(
//                     'assets/images/home.png',
//                     width: 150.w,
//                     height: 150.h,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             Positioned(
//               top: 160.h,
//               left: 0.w,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Scan()));
//                 },
//                 child: Container(
//                   height: 70.h,
//                   width: 70.w,
//                   color: Colors.white,
//                   child: Image.asset(
//                     'assets/images/scan.png',
//                     width: 150.w,
//                     height: 150.h,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             Positioned(
//               top: 250.h,
//               left: 0.w,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Ticket()));
//                 },
//                 child: Container(
//                   height: 70.h,
//                   width: 70.w,
//                   color: Colors.white,
//                   child: Image.asset(
//                     'assets/images/ticket.png',
//                     width: 150.w,
//                     height: 150.h,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             Positioned(
//               top: 340.h,
//               left: 0.w,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Logout()));
//                 },
//                 child: Container(
//                   height: 70.h,
//                   width: 70.w,
//                   color: Colors.white,
//                   child: Image.asset(
//                     'assets/images/logout.png',
//                     width: 150.w,
//                     height: 150.h,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//
//             //Text
//             Positioned(
//               top: 80.h,
//               left: 130.w,
//               child: Text(
//                 'TICKETS',
//                 style: TextStyle(fontSize: 34.sp, color: Color(0xFFF4F4F4), fontFamily: 'Poppins'),
//               ),
//             ),
//
//             //Text
//             Positioned(
//               top: 135.h,
//               left: 132.w,
//               child: Text(
//                 'EMITIDOS',
//                 style: TextStyle(
//                     fontSize: 25.sp,
//                     color: Color(0xFFF4F4F4),
//                     fontFamily: 'Poppins'
//                 ),
//               ),
//             ),
//
//             //Ticket Image
//             Positioned(
//               top: 170.h,
//               left: 132.w,
//               child: Container(
//                 height: 127.h,
//                 width: 150.w,
//                 color: Colors.white,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 18.h),
//                   child: Image.asset(
//                     'assets/images/ticket2.png',
//                     width: 200.w,
//                     height: 200.h,
//                     fit: BoxFit.cover,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//
//             //Image Text
//             Positioned(
//               top: 310.h,
//               left: 132.w,
//               child: Text(
//                 '   $bookedTickets',
//                 style: TextStyle(
//                     fontSize: 36.sp,
//                     color: Color(0xFFE5E5E5),
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Poppins'
//                 ),
//               ),
//             ),
//
//             //Conform Ticket
//             Positioned(
//               top: 380.h,
//               left: 134.w,
//               child: Text(
//                 'VALIDADOS',
//                 style: TextStyle(fontSize: 25.sp, color: Color(0xFFF4F4F4), fontFamily: 'Poppins'),
//               ),
//             ),
//
//             //Confirm Image
//             Positioned(
//               top: 420.h,
//               left: 132.w,
//               child: Container(
//                 height: 127.h,
//                 width: 150.w,
//                 color: Colors.white,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 18.h),
//                   child: Image.asset(
//                     'assets/images/ticket2.png',
//                     width: 200.w,
//                     height: 200.h,
//                     fit: BoxFit.cover,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//
//             //Confirm Image
//             Positioned(
//               top: 460.h,
//               left: 232.w,
//               child: Container(
//                 height: 80.h,
//                 width: 80.h,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(50.h),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8.h),
//                   child: Image.asset(
//                     'assets/images/correct.png',
//                     width: 20.w,
//                     height: 20.h,
//                     fit: BoxFit.cover,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//
//             //Confirm Text
//             Positioned(
//               top: 560.h,
//               left: 132.w,
//               child: Text(
//                 '   $scannedTickets',
//                 style: TextStyle(
//                     fontSize: 36.sp,
//                     color: Color(0xFF25CB4A),
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Poppins'
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
