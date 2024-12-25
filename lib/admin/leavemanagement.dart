import 'package:flutter/material.dart';

class ManageLeaveRequestsScreen extends StatelessWidget {
  final List<Map<String, String>> leaveRequests = [
    {'name': 'Ali', 'date': '2024-12-22', 'reason': 'Personal Leave'},
    {'name': 'Ahmad', 'date': '2024-12-22', 'reason': 'Personal Leave'},
    {'name': 'Umar', 'date': '2024-12-23', 'reason': 'Medical Leave'},
    {'name': 'Ali', 'date': '2024-12-22', 'reason': 'Personal Leave'},
    {'name': 'Umar', 'date': '2024-12-23', 'reason': 'Medical Leave'},
  ];

  ManageLeaveRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF0A65FC),
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF0A65FC),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Text(
                'Manage Leave Requests',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: leaveRequests.length,
                    itemBuilder: (context, index) {
                      final request = leaveRequests[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF0A65FC),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(request['name']!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            'Date: ${request['date']} \nReason: ${request['reason']}',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.check, color: Colors.green),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Approved ${request['name']}\'s request')),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.close, color: Colors.red),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Rejected ${request['name']}\'s request')),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
