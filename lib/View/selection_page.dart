import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pillatickets/View/home.dart';
import '../Controller/data.dart';
import 'package:http/http.dart' as http;

class SelectionScreen extends StatefulWidget {
  SelectionScreen({Key? key}) : super(key: key);

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  late Future<List<Event>> eventsFuture;

  @override
  void initState() {
    super.initState();
    eventsFuture = getEvents();
  }

  Future<List<Event>> getEvents() async {
    var response = await http.get(Uri.https('jobfid.com', 'api/get-events'));
    var jsonData = jsonDecode(response.body);
    List<Event> events = [];

    for (var eachEvents in jsonData['data']['events']) {
      final event = Event(
        id: eachEvents['id'],
        title: eachEvents['title'],
        place: eachEvents['place'],
      );
      events.add(event);
    }
    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF24292E),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),

                Text(
                  "PILLATICKETS",
                  style: TextStyle(
                      color: Color(0xFF557089),
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      fontFamily: 'Poppins'),
                ),

                SizedBox(
                  height: 20.h,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                    padding: EdgeInsets.all(18.h),
                    decoration: BoxDecoration(
                      color: Color(0xFF557089),
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                    child: Center(
                      child: InkWell(
                        child: Text(
                          "Selecciona el evento",
                          style: TextStyle(
                            color: Color(0xFFF4F4F4),
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 8.h,
                ),

                //events
                Padding(
                  padding: EdgeInsets.all(20.h),
                  child: Container(
                    height: 380.h,
                    width: 300.w,
                    padding: EdgeInsets.all(15.h),
                    decoration: BoxDecoration(
                      color: Color(0xFF323940),
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder<List<Event>>(
                        future: eventsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white));
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            List<Event> events = snapshot.data ?? [];
                            return ListView.builder(
                              itemCount: events.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(4.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF557089),
                                      borderRadius: BorderRadius.circular(8.h),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        print(events[index].id.toString());
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Home(
                                                eventId: events[index]
                                                    .id
                                                    .toString()),
                                          ),
                                        ).then((_) {
                                          // When returning from Home screen, trigger data update
                                          setState(() {
                                            eventsFuture =
                                                getEvents(); // Fetch events again if needed
                                          });
                                        });
                                      },
                                      child: ListTile(
                                        title: Center(
                                          child: Text(
                                            events[index].title,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        subtitle: Center(
                                          child: Text(
                                            events[index].place,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 15.h,
                ),

                //black lab
                Container(
                  color: Color(0xFF002E3D),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Powered by ",
                        style: TextStyle(
                            color: Color(0xFFF4F4F4),
                            fontWeight: FontWeight.bold,
                            fontSize: 12.h,
                            fontFamily: 'Poppins'),
                      ),
                      Text(
                        "BLACK LAB",
                        style: TextStyle(
                            color: Color(0xFFF4F4F4),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.h,
                            fontFamily: 'Poppins'),
                      ),
                      Image(
                        image: AssetImage('assets/images/thunder.png'),
                        height: 22.h,
                        width: 16.w,
                        color: Color(0xFFFFFFFF),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
