import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ManagedNotificationScreen extends StatefulWidget {
  const ManagedNotificationScreen({super.key});

  @override
  _ManagedNotificationScreenState createState() =>
      _ManagedNotificationScreenState();
}

class _ManagedNotificationScreenState extends State<ManagedNotificationScreen> {
  final List<NotificationModel> _notifications = [
    NotificationModel(
      id: 1,
      title: 'New Leave Request',
      message: 'John Doe has applied for a leave on 12th Jan 2023',
      timestamp: DateTime.now().subtract(Duration(days: 2)),
    ),
    NotificationModel(
      id: 2,
      title: 'Overtime Request Approved',
      message: 'Your overtime request for 15th Jan 2023 has been approved',
      timestamp: DateTime.now().subtract(Duration(days: 1)),
    ),
    NotificationModel(
      id: 3,
      title: 'New Task Assigned',
      message:
          'You have been assigned a new task "Complete Project Report" by 20th Jan 2023',
      timestamp: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: const Color(0xFF0A65FC),
            child: Column(children: [
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Manage Notifications ',
                  style: TextStyle(
                    fontSize: 30,
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
                          itemCount: _notifications.length,
                          itemBuilder: (context, index) {
                            return NotificationCard(
                              notification: _notifications[index],
                            );
                          },
                        ),
                      )))
            ])));
  }
}

class NotificationModel {
  int id;
  String title;
  String message;
  DateTime timestamp;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
  });
}

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              notification.title,
              style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              notification.message,
              style: TextStyle(fontSize: 16,color: Colors.white,),
            ),
            SizedBox(height: 8),
            Text(
              'Received on ${DateFormat('dd MMM yyyy hh:mm a').format(notification.timestamp)}',
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
