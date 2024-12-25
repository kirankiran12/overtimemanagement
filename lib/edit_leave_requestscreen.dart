import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveRequest {
  String leaveType;
  String startDate;
  String endDate;
  String reason;

  LeaveRequest({
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.reason,
  });
}

class EditLeaveRequestScreen extends StatefulWidget {
  final LeaveRequest leaveRequest;

  EditLeaveRequestScreen({Key? key, required this.leaveRequest})
      : super(key: key);

  @override
  _EditLeaveRequestScreenState createState() => _EditLeaveRequestScreenState();
}

class _EditLeaveRequestScreenState extends State<EditLeaveRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _leaveType, _startDate, _endDate, _reason;
  late DateTime _startDateDateTime, _endDateDateTime;
  late TextEditingController _startDateController, _endDateController;

  @override
  void initState() {
    super.initState();
    _leaveType = widget.leaveRequest.leaveType;
    _startDate = widget.leaveRequest.startDate;
    _endDate = widget.leaveRequest.endDate;
    _reason = widget.leaveRequest.reason;
    _startDateDateTime = DateTime.parse(_startDate);
    _endDateDateTime = DateTime.parse(_endDate);
    _startDateController = TextEditingController(text: _startDate);
    _endDateController = TextEditingController(text: _endDate);
  }

  Future<void> _selectDate({
    required BuildContext context,
    required DateTime initialDate,
    required TextEditingController controller,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
        if (controller == _startDateController) {
          _startDateDateTime = picked;
          _startDate = DateFormat('yyyy-MM-dd').format(picked);
        } else {
          _endDateDateTime = picked;
          _endDate = DateFormat('yyyy-MM-dd').format(picked);
        }
      });
    }
  }

  void _updateLeaveRequest() {
    print('Updated Leave Request:');
    print('Type: $_leaveType');
    print('Start Date: $_startDate');
    print('End Date: $_endDate');
    print('Reason: $_reason');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Leave request updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double titleFontSize = screenWidth * 0.07;
    double buttonFontSize = screenWidth * 0.035;

    return Scaffold(
      body: Container(
        color: Color(0xFF0A65FC),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Text(
              'Edit Leave Request',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: titleFontSize,
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
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Leave Type',
                            border: OutlineInputBorder(),
                          ),
                          initialValue: _leaveType,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
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
                              child: GestureDetector(
                                onTap: () => _selectDate(
                                  context: context,
                                  initialDate: _startDateDateTime,
                                  controller: _startDateController,
                                ),
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: _startDateController,
                                    decoration: InputDecoration(
                                      labelText: 'Start Date',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select a start date';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => _selectDate(
                                  context: context,
                                  initialDate: _endDateDateTime,
                                  controller: _endDateController,
                                ),
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: _endDateController,
                                    decoration: InputDecoration(
                                      labelText: 'End Date',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select an end date';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
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
                          initialValue: _reason,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a reason';
                            }
                            return null;
                          },
                          onSaved: (value) => _reason = value!,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0A65FC),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _updateLeaveRequest();
                            }
                          },
                          child: Text(
                            'Update Leave Request',
                            style: TextStyle(
                              fontSize: buttonFontSize,
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
