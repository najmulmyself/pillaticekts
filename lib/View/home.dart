import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pillatickets/View/logout.dart';
import 'package:pillatickets/View/scan.dart';
import 'package:pillatickets/View/ticket.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final String eventId;
  const Home({Key? key, required this.eventId}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int bookedTickets = 0;
  int scannedTickets = 0;
  int remainingTickets = 0;

  Future<void> saveEventId() async {
    // Store the eventId in SharedPreferences
    if (widget.eventId == '') {
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('eventId', widget.eventId);
    }
  }

  Future<void> fetchData() async {
    // Retrieve the eventId from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? SeventId = prefs.getString('eventId');

    final response = await http
        .get(Uri.parse('http://jobfid.com/api/event-tickets-info/$SeventId'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'];
      setState(() {
        bookedTickets = data['booked'];
        scannedTickets = data['scaned'];
        remainingTickets = data['remaining'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    saveEventId();
    fetchData();
  }

  Future<void> updateData() async {
    await fetchData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF24292E),
      body: SafeArea(
        child: Stack(
          children: [
            //App Bar
            Container(
              height: 55.h,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF002E3D),
              child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "      IN-EDIT CCS",
                    style: TextStyle(
                        color: Color(0xFFF4F4F4),
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
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
              child: Container(
                height: 70.h,
                width: 70.w,
                color: Color(0xFFB0C756),
                child: Image.asset(
                  'assets/images/home.png',
                  width: 150.w,
                  height: 150.h,
                  fit: BoxFit.cover,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scan(
                                zoneId: '',
                                eventId: widget.eventId,
                              )));
                },
                child: Container(
                  height: 70.h,
                  width: 70.w,
                  color: Colors.white,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Ticket(
                                eventId: '',
                              )));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Logout(
                                eventId: '',
                                zoneId: '',
                              )));
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

            //Body
            //Text
            Positioned(
              top: 70.h,
              left: 160.w,
              child: Text(
                'TICKETS',
                style: TextStyle(
                    fontSize: 25.sp,
                    color: Color(0xFFF4F4F4),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            ),

            //Emitidos
            Positioned(
              top: 120.h,
              left: 120.w,
              child: Container(
                height: 110.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: Color(0xFF557089),
                  borderRadius: BorderRadius.circular(12.h),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "$bookedTickets",
                          style: TextStyle(
                              color: Color(0xFFF4F4F4),
                              fontWeight: FontWeight.bold,
                              fontSize: 35.sp,
                              fontFamily: 'Poppins'),
                        ),
                        Text(
                          "EMITIDOS",
                          style: TextStyle(
                              color: Color(0xFFF4F4F4),
                              fontSize: 15.sp,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //validados
            Positioned(
              top: 260.h,
              left: 120.w,
              child: Container(
                height: 110.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: Color(0xFF557089),
                  borderRadius: BorderRadius.circular(12.h),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "$scannedTickets",
                          style: TextStyle(
                              color: Color(0xFF25CB4A),
                              fontWeight: FontWeight.bold,
                              fontSize: 35.sp,
                              fontFamily: 'Poppins'),
                        ),
                        Text(
                          "VALIDADOS",
                          style: TextStyle(
                              color: Color(0xFFF4F4F4),
                              fontSize: 15.sp,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //Restantes
            Positioned(
              top: 400.h,
              left: 120.w,
              child: Container(
                height: 110.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: Color(0xFF557089),
                  borderRadius: BorderRadius.circular(12.h),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "$remainingTickets",
                          style: TextStyle(
                              color: Color(0xFFF7FB2B),
                              fontWeight: FontWeight.bold,
                              fontSize: 35.sp,
                              fontFamily: 'Poppins'),
                        ),
                        Text(
                          "RESTANTES",
                          style: TextStyle(
                              color: Color(0xFFF4F4F4),
                              fontSize: 15.sp,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
