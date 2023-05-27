import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:pillatickets/View/qrsuccess.dart';
import 'package:pillatickets/View/qrunsuccess.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
  final String zoneName;
  final String zoneId;
  QRScannerPage(
      {required this.zoneName, required this.zoneId, required String eventId});

  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey _globalKey = GlobalKey();

  QRViewController? controller;
  Barcode? result;

  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
        if (result != null && result!.code != null) {
          print('THis is scan result code : ${result!.code}');
          print('ZZZZZZZZZZZZZZZZZZ: ${widget.zoneName}');
          checkTicketId(result!.code!);
        }
      });
    });
  }

  Future<void> checkTicketId(String ticketId) async {
    print('Ticket id froom function : ${ticketId}');
    try {
      final response = await http.post(
        Uri.parse('https://jobfid.com/api/scan/checkin'),
        body: {
          'ticket_id': ticketId,
          'zone': widget.zoneName,
        },
      );
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        print(
            'RESSSSSSSSSSSSSSSSSSSSSSS:   ${decodedResponse['data']['status']}');
        final bool isValid = decodedResponse['data']['status'] == 'valid';
        if (isValid) {
          final String name = decodedResponse['data']['booking']['name'];
          final String surname = decodedResponse['data']['booking']['surname'];
          navigateToSuccessPage(name, surname, ticketId);
        } else {
          print("not valid");
          navigateToFailurePage();
        }
      } else {
        print("failed 200");
        navigateToFailurePage();
      }
    } catch (e) {
      print(e);
      navigateToFailurePage();
    }
  }

  void navigateToSuccessPage(String name, String surname, String ticketId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SuccessPage(name: name, surname: surname, ticketId: ticketId),
      ),
    );
  }

  void navigateToFailurePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FailurePage(
          zoneId: widget.zoneId,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner')),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 4.0),
            ),
            child: QRView(
              key: _globalKey,
              onQRViewCreated: qr,
              overlay: QrScannerOverlayShape(
                borderRadius: 10.h,
                borderColor: Color(0xFF557089),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0.h),
              child: Text(
                'Scan QR Code',
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class SuccessPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic> args =
//     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Success')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Name: ${args['name']} ${args['surname']}',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Ticket ID: ${args['ticketId']}',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Created At: ${args['createdAt']}',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Email: ${args['email']}',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Mobile: ${args['mobile']}',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Type: ${args['type']}',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Zones:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: args['zones'].length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(args['zones'][index]),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class FailurePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Failure')),
//       body: Center(
//         child: Text(
//           'Invalid QR Code',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
