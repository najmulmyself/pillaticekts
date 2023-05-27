import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Details extends StatelessWidget {
  final Map<String, dynamic>? booking;
  final Map<String, dynamic>? jsonData;
  final Map<String, dynamic>? ticket;
  final Map<String, dynamic>? detailsData;

  Details({Key? key, this.booking, this.jsonData, this.ticket, this.detailsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int? ticketTypeId = booking != null ? booking!['ticket_type'] as int? : null;
    final dynamic ticketType = ticketTypeId != null ? jsonData!['data']['ticket']['booking']['ticket_type'] : null;
    final String ticketName = ticketType != null ? ticketType['ticket_name'] ?? '' : ticketTypeId.toString();
    final List<dynamic>? checkIns = ticket != null ? ticket!['check_ins'] as List<dynamic>? : null;
    final List<dynamic>? checkOuts = ticket != null ? ticket!['check_outs'] as List<dynamic>? : null;
    final List<dynamic>? zones = ticketType != null ? ticketType['zones'] as List<dynamic>? : null;

    final String name = booking != null ? booking!['name'] ?? '' : '';
    final String surname = booking != null ? booking!['surname'] ?? '' : '';
    final int? ticketId = booking != null ? booking!['ticket_id'] as int? : null;
    final String createdAt = booking != null && booking!['created_at'] != null
        ? DateFormat('yyyy-MM-dd').format(DateTime.parse(booking!['created_at']))
        : '';
    final List<String> checkInTimes =
        checkIns?.map((checkIn) => checkIn['check_in_time'].toString()).toList() ?? [];
    final List<String> checkOutTimes =
        checkOuts?.map((checkOut) => checkOut['check_out_time'].toString()).toList() ?? [];
    final List<String> zoneNames = zones?.map((zone) => zone['zone_name'].toString()).toList() ?? ['-'];
    final String email = booking != null ? booking!['email'] ?? '' : '';
    final String mobile = booking != null ? booking!['mobile'] ?? '' : '';


    return Scaffold(
      appBar: AppBar(
        title: Text('BÚSQUEDA TICKET', style: TextStyle(),),
        backgroundColor: Color(0xFF002E3D),
      ),
      backgroundColor: Color(0xFF24292E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$name $surname', style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),),
            SizedBox(height: 10.h),
            Text('ID: ${ticketId ?? ''}', style: TextStyle(color: Colors.white, fontSize: 20.sp,),),
            SizedBox(height: 10.h),
            Text('Date: $createdAt', style: TextStyle(color: Colors.white, fontSize: 20.sp,),),
            SizedBox(height: 30.h),
            Text('Ticket Type: $ticketName', style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),),
            SizedBox(height: 10.h),
            Text('Check-Ins: ${checkInTimes.join(', ')}', style: TextStyle(color: Colors.white, fontSize: 20.sp,),),
            SizedBox(height: 10.h),
            Text('Check-Outs: ${checkOutTimes.join(', ')}', style: TextStyle(color: Colors.white, fontSize: 20.sp,),),
            SizedBox(height: 30.h),
            Text('Status: Válido', style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),),
            SizedBox(height: 10.h),
            Text('Acceso: ${zoneNames.join(', ')}', style: TextStyle(color: Colors.white, fontSize: 20.sp,),),
            SizedBox(height: 10.h),
            Text('Email: $email', style: TextStyle(color: Colors.white, fontSize: 20.sp,),),
            SizedBox(height: 10.h),
            Text('Mobile: $mobile', style: TextStyle(color: Colors.white, fontSize: 20.sp,),),
          ],
        ),
      ),
    );
  }
}
