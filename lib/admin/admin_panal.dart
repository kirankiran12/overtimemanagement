import 'package:flutter/material.dart';
import 'package:overtime_managment/admin/leavemanagement.dart';
import 'package:overtime_managment/admin/manageOvertime.dart';
import 'package:overtime_managment/admin/manageSetting.dart';
import 'package:overtime_managment/admin/manageuserscreen.dart';
import 'package:overtime_managment/admin/managnotification.dart';
import 'package:overtime_managment/admin/shiftmangment.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF0A65FC),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text(
              'Admin Panel',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(20.0),
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF0A65FC),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        textColor: Colors.white,
                        title: const Text(
                          'Manage Users',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ManageUsersScreen()),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF0A65FC),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        textColor: Colors.white,
                        title: const Text(
                          'Manage Shifts',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ManageShiftsScreen()),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF0A65FC),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        textColor: Colors.white,
                        title: const Text(
                          'Manage Leave Requests',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ManageLeaveRequestsScreen()),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF0A65FC),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        textColor: Colors.white,
                        title: const Text(
                          'Manage Overtime Requests',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                             onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ManageOvertimeRequestScreen() ),
                          );
                        },
                            
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF0A65FC),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        textColor: Colors.white,
                        title: const Text(
                          'Manage Notfication',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ManagedNotificationScreen()),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFF0A65FC),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        textColor: Colors.white,
                        title: const Text(
                          'Manage Setting',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ManageSettingScreen()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}







































