import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateLeaveRequestScreen extends StatefulWidget {
  const CreateLeaveRequestScreen({super.key});

  @override
  _CreateLeaveRequestScreenState createState() =>
      _CreateLeaveRequestScreenState();
}

class _CreateLeaveRequestScreenState extends State<CreateLeaveRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _leaveType, _startDate, _endDate, _reason;
  late DateTime _startDateDateTime, _endDateDateTime;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double titleFontSize = screenWidth * 0.07;

    return Scaffold(
      body: Container(
        color: Color(0xFF0A65FC),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Text(
              'Create Leave Request',
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
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
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Leave Type',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please select a leave type';
                            }
                            return null;
                          },
                          onSaved: (value) => _leaveType = value!,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Start Date',
                                  border: OutlineInputBorder(),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2025),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      _startDate = DateFormat('yyyy-MM-dd')
                                          .format(picked);
                                      _startDateDateTime = picked;
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please select a start date';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'End Date',
                                  border: OutlineInputBorder(),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        _startDateDateTime ?? DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2025),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      _endDate = DateFormat('yyyy-MM-dd')
                                          .format(picked);
                                      _endDateDateTime = picked;
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please select an end date';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Reason',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a reason';
                            }
                            return null;
                          },
                          onSaved: (value) => _reason = value!,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0A65FC)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            }
                          },
                          child: Text(
                            'Create Leave Request',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
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
