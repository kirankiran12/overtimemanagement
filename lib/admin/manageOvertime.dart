import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:overtime_managment/create_overtime_requestscreen.dart';

class ManageOvertimeRequestScreen extends StatefulWidget {
  const ManageOvertimeRequestScreen({super.key});

  @override
  _ManageOvertimeRequestScreenState createState() =>
      _ManageOvertimeRequestScreenState();
}

class _ManageOvertimeRequestScreenState
    extends State<ManageOvertimeRequestScreen> {
  final List<OvertimeRequestModel> _overtimeRequests = [
    OvertimeRequestModel(
      id: 1,
      employeeName: 'Ali',
      overtimeType: 'Regular',
      startDate: DateTime.now().subtract(Duration(days: 2)),
      endDate: DateTime.now().subtract(Duration(days: 1)),
      hours: 10,
      status: 'Pending',
    ),
    OvertimeRequestModel(
      id: 2,
      employeeName: 'Umar',
      overtimeType: 'Emergency',
      startDate: DateTime.now().subtract(Duration(days: 1)),
      endDate: DateTime.now(),
      hours: 5,
      status: 'Approved',
    ),
      OvertimeRequestModel(
      id: 3,
      employeeName: 'Ali',
      overtimeType: 'Regular',
      startDate: DateTime.now().subtract(Duration(days: 2)),
      endDate: DateTime.now().subtract(Duration(days: 1)),
      hours: 10,
      status: 'Pending',
    ),
    OvertimeRequestModel(
      id: 4,
      employeeName: 'Ahmad',
      overtimeType: 'Regular',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(days: 1)),
      hours: 8,
      status: 'Pending',
    ),
  ];

  void _updateStatus(int id, String newStatus) {
    setState(() {
      final request = _overtimeRequests.firstWhere((req) => req.id == id);
      request.status = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: const Color(0xFF0A65FC),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Manage Overtime Requests',
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: _overtimeRequests.length,
                    itemBuilder: (context, index) {
                      return OvertimeRequestCard(
                        overtimeRequest: _overtimeRequests[index],
                        onApprove: () => _updateStatus(
                            _overtimeRequests[index].id, 'Approved'),
                        onReject: () => _updateStatus(
                            _overtimeRequests[index].id, 'Rejected'),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateOvertimeRequestScreen()),
        );
      },
      backgroundColor: const Color(0xFF0A65FC),
      child: const Icon(Icons.add, color: Colors.white),
    ),
  );
}

    
  }


class OvertimeRequestModel {
  int id;
  String employeeName;
  String overtimeType;
  DateTime startDate;
  DateTime endDate;
  int hours;
  String status;

  OvertimeRequestModel({
    required this.id,
    required this.employeeName,
    required this.overtimeType,
    required this.startDate,
    required this.endDate,
    required this.hours,
    required this.status,
  });
}

class OvertimeRequestCard extends StatelessWidget {
  final OvertimeRequestModel overtimeRequest;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const OvertimeRequestCard({
    required this.overtimeRequest,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0A65FC),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Employee Name: ${overtimeRequest.employeeName}',
              style:
                  TextStyle(fontSize: screenWidth * 0.047, 
                                  color: Colors.white,
                               
                                  fontWeight: FontWeight.bold)),
            
            const SizedBox(height: 8),
            Text(
              'Overtime Type: ${overtimeRequest.overtimeType}',
              style:
                  TextStyle(fontSize: screenWidth * 0.04, color: Colors.white, 
                               
                                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Start Date: ${DateFormat('dd MMM yyyy').format(overtimeRequest.startDate)}',
              style:
                  TextStyle(fontSize: screenWidth * 0.04, color: Colors.white,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'End Date: ${DateFormat('dd MMM yyyy').format(overtimeRequest.endDate)}',
              style:
                  TextStyle(fontSize: screenWidth * 0.04, color: Colors.white,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Hours: ${overtimeRequest.hours}',
              style:
                  TextStyle(fontSize: screenWidth * 0.04, color: Colors.white,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${overtimeRequest.status}',
              style:
                  TextStyle(fontSize: screenWidth * 0.04, color: Colors.red,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onApprove,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Approve', style:
                  TextStyle(fontSize:15, color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onReject,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Reject', style:
                  TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
