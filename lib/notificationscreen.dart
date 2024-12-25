import 'dart:convert';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Notification> _notifications = [
    Notification(
        title: 'Notification 1', subtitle: 'Date: 2024-12-13', isRead: true),
    Notification(
        title: 'Notification 2', subtitle: 'Date: 2024-12-14', isRead: true),
    Notification(
        title: 'Notification 3', subtitle: 'Date: 2024-12-15', isRead: false),
  ];

  void _markAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        notification.isRead = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF0A65FC),
      body: Container(
        color: Color(0xFF0A65FC),
        child: Column(
          children: [
            SizedBox(height: height * 0.1),
            Text(
              'Notifications',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.08,
              ),
            ),
            SizedBox(height: height * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
            ),
            SizedBox(height: height * 0.05),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    itemCount: _notifications.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          _notifications[index].title,
                          style: TextStyle(fontSize: width * 0.05),
                        ),
                        subtitle: Text(
                          _notifications[index].subtitle,
                          style: TextStyle(fontSize: width * 0.04),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: _notifications[index].isRead,
                              onChanged: (value) {
                                setState(() {
                                  _notifications[index].isRead = value!;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              icon:
                                  Icon(Icons.delete, color: Color(0xFF0A65FC)),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Delete Notification'),
                                      content: Text(
                                          'Are you sure you want to delete this notification?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _notifications.removeAt(index);
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
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

class Notification {
  String title;
  String subtitle;
  bool isRead;

  Notification({
    required this.title,
    required this.subtitle,
    required this.isRead,
  });

  Notification copyWith({
    String? title,
    String? subtitle,
    bool? isRead,
  }) {
    return Notification(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'isRead': isRead,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      isRead: map['isRead'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) =>
      Notification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Notification(title: $title, subtitle: $subtitle, isRead: $isRead)';

  @override
  bool operator ==(covariant Notification other) {
    if (identical(this, other)) return true;
    return other.title == title &&
        other.subtitle == subtitle &&
        other.isRead == isRead;
  }

  @override
  int get hashCode => title.hashCode ^ subtitle.hashCode ^ isRead.hashCode;
}
