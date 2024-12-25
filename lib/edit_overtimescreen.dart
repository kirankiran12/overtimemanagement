import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OvertimeRequest {
  String overtimeType;
  String startDate;
  String endDate;
  String reason;
  String hours;

  OvertimeRequest({
    required this.overtimeType,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.hours,
  });
}

class EditOvertimeRequestScreen extends StatefulWidget {
  final OvertimeRequest overtimeRequest;

  EditOvertimeRequestScreen({
    Key? key,
    required this.overtimeRequest,
  }) : super(key: key);

  @override
  _EditOvertimeRequestScreenState createState() =>
      _EditOvertimeRequestScreenState();
}

class _EditOvertimeRequestScreenState extends State<EditOvertimeRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _overtimeType;
  late String _startDate;
  late String _endDate;
  late String _reason;
  late String _hours;
  late DateTime _startDateDateTime;
  late DateTime _endDateDateTime;

  @override
  void initState() {
    super.initState();
    _overtimeType = widget.overtimeRequest.overtimeType;

    try {
      _startDateDateTime =
          DateFormat('yyyy/MM/dd').parse(widget.overtimeRequest.startDate);
      _endDateDateTime =
          DateFormat('yyyy/MM/dd').parse(widget.overtimeRequest.endDate);
    } catch (e) {
      _startDateDateTime = DateTime.now();
      _endDateDateTime = DateTime.now();
    }

    _startDate = DateFormat('yyyy-MM-dd').format(_startDateDateTime);
    _endDate = DateFormat('yyyy-MM-dd').format(_endDateDateTime);

    _reason = widget.overtimeRequest.reason;
    _hours = widget.overtimeRequest.hours;
  }

  Future<void> _selectDate({
    required BuildContext context,
    required DateTime initialDate,
    required Function(DateTime) onDateSelected,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }

  void _updateOvertimeRequest() {
    print('Updated Overtime Request:');
    print('Type: $_overtimeType');
    print('Start Date: $_startDate');
    print('End Date: $_endDate');
    print('Reason: $_reason');
    print('Hours: $_hours');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Overtime request updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double titleFontSize = screenWidth * 0.07;
    double buttonFontSize = screenWidth * 0.04;

    return Scaffold(
      body: Container(
        color: Color(0xFF0A65FC),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Text(
              'Edit Overtime Request',
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
                    child: ListView(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Overtime Type',
                            border: OutlineInputBorder(),
                          ),
                          initialValue: _overtimeType,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please select an overtime type';
                            }
                            return null;
                          },
                          onSaved: (value) => _overtimeType = value!,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => _selectDate(
                                  context: context,
                                  initialDate: _startDateDateTime,
                                  onDateSelected: (picked) {
                                    setState(() {
                                      _startDate = DateFormat('yyyy-MM-dd')
                                          .format(picked);
                                      _startDateDateTime = picked;
                                    });
                                  },
                                ),
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Start Date',
                                      border: OutlineInputBorder(),
                                    ),
                                    initialValue: _startDate,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please select a start date';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => _selectDate(
                                  context: context,
                                  initialDate: _endDateDateTime,
                                  onDateSelected: (picked) {
                                    setState(() {
                                      _endDate = DateFormat('yyyy-MM-dd')
                                          .format(picked);
                                      _endDateDateTime = picked;
                                    });
                                  },
                                ),
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'End Date',
                                      border: OutlineInputBorder(),
                                    ),
                                    initialValue: _endDate,
                                    validator: (value) {
                                      if (value!.isEmpty) {
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
                            if (value!.isEmpty) {
                              return 'Please enter a reason';
                            }
                            return null;
                          },
                          onSaved: (value) => _reason = value!,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Hours',
                            border: OutlineInputBorder(),
                          ),
                          initialValue: _hours,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the number of hours';
                            }
                            return null;
                          },
                          onSaved: (value) => _hours = value!,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0A65FC),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _updateOvertimeRequest();
                            }
                          },
                          child: Text(
                            'Update Overtime Request',
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
