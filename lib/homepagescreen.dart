import 'package:flutter/material.dart';
import 'package:overtime_managment/admin/admin_panal.dart';

import 'package:overtime_managment/create_leaverequest%20screen.dart';
import 'package:overtime_managment/create_overtime_requestscreen.dart';
import 'package:overtime_managment/create_shiftscreen.dart';
import 'package:overtime_managment/edit_leave_requestscreen.dart';
import 'package:overtime_managment/edit_overtimescreen.dart';
import 'package:overtime_managment/home/generateshift.dart';

import 'package:overtime_managment/leave_requestscreen.dart';
import 'package:overtime_managment/notificationscreen.dart';
import 'package:overtime_managment/overtime_requestscreen.dart';

import 'package:overtime_managment/userprofilescreen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  late AnimationController _animationController;
  late Animation<double> _logoScaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF0A65FC),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 90),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: screenWidth * 0.09,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: ScaleTransition(
                scale: _logoScaleAnimation,
                child: SizedBox(
                  height: 130,
                  width: 150,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        _buildGridRow(
                            context,
                            screenWidth,
                            'Shifts',
                            'assets/images/shift.png',
                            //  ShiftsScreen1(),
                            ShiftScreen1(),
                            // ShiftsScreen1(),
                            'LeaveRequests',
                            'assets/images/leave.png',
                            const LeaveRequestsScreen()),
                        const SizedBox(height: 20),
                        _buildGridRow(
                            context,
                            screenWidth,
                            'Overtime Request',
                            'assets/images/overtime.png',
                            const OvertimeRequestsScreen(),
                            'Notification',
                            'assets/images/notification.png',
                            const NotificationsScreen()),
                        const SizedBox(height: 20),
                        _buildGridRow(
                          context,
                          screenWidth,
                          'user Profile',
                          'assets/images/profile.png',
                          const UserProfileScreen(),
                          'Admin',
                          'assets/images/admin1.png',
                          const AdminPanel(),
                        ),
                        const SizedBox(height: 20),
                        _buildGridRow(
                          context,
                          screenWidth,
                          'Createshift',
                          'assets/images/createshift.png',
                          const CreateShiftScreen(),
                          'CreateLeaverequest',
                          'assets/images/createleave.png',
                          const CreateLeaveRequestScreen(),
                        ),
                        const SizedBox(height: 20),
                        _buildGridRow(
                          context,
                          screenWidth,
                          'CreateOvertimeReq',
                          'assets/images/shifttt.gif',
                          const CreateOvertimeRequestScreen(),
                          'EditOvertimerequest',
                          'assets/images/createovertime.png',
                          EditOvertimeRequestScreen(
                            overtimeRequest: OvertimeRequest(
                              overtimeType: 'mandatory',
                              startDate: '2024-03-23',
                              endDate: '2024-03-25',
                              reason: 'fever',
                              hours: '3',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildGridRow(
                          context,
                          screenWidth,
                          'EditLeaveRequest',
                          'assets/images/editleave.png',
                          EditLeaveRequestScreen(
                            leaveRequest: LeaveRequest(
                                leaveType: 'madatory',
                                startDate: '2024-03-23',
                                endDate: '2024-03-24',
                                reason: 'fever'),
                          ),
                          'EditOvertimerequest',
                          'assets/images/createleave.png',
                          const OvertimeRequestsScreen(),
                        ),
                        const SizedBox(height: 20),
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

  Widget _buildInfoCard(double screenWidth, String label1, String label2,) {
    return Center(
      child: Container(
        height: 130,
        width: screenWidth * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCardItem(label1, Colors.blue, Colors.white),
            _buildCardItem(label2, Colors.white, Colors.blue)
          ],
        ),
      ),
    );
  }

  Widget _buildCardItem(String label, Color bgColor, Color textColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: textColor)),
      ],
    );
  }

  Widget _buildGridRow(
      BuildContext context,
      double screenWidth,
      String label1,
      String asset1,
      Widget route1,
      String label2,
      String asset2,
      Widget route2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildGridItem(context, screenWidth, label1, asset1, route1),
        _buildGridItem(context, screenWidth, label2, asset2, route2),
      ],
    );
  }

  Widget _buildGridItem(BuildContext context, double screenWidth, String label,
      String assetPath, Widget route) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      child: Container(
        height: 100,
        width: screenWidth * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 60,
                width: 60,
                child: Image.asset(assetPath),
              ),
            ),
            const SizedBox(height: 5),
            Text(label,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A65FC))),
          ],
        ),
      ),
    );
  }
}
