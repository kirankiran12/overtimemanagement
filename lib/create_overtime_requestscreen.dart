import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateOvertimeRequestScreen extends StatefulWidget {
  const CreateOvertimeRequestScreen({super.key});

  @override
  _CreateOvertimeRequestScreenState createState() =>
      _CreateOvertimeRequestScreenState();
}

class _CreateOvertimeRequestScreenState
    extends State<CreateOvertimeRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _overtimeType, _reason, _hours;
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double titleFontSize = screenWidth * 0.08;
    double inputFontSize = screenWidth * 0.04;
    double buttonFontSize = screenWidth * 0.04;
    double formPadding = screenWidth * 0.05;
    double verticalSpacing = screenHeight * 0.02;
    double buttonHeight = screenHeight * 0.07;

    return Scaffold(
      body: Container(
        color: const Color(0xFF0A65FC),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Text(
              'Create Overtime Request',
              style: TextStyle(
                color: Colors.white,
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(formPadding),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Overtime Type',
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(fontSize: inputFontSize),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please select an overtime type';
                              }
                              return null;
                            },
                            onSaved: (value) => _overtimeType = value!,
                          ),
                          SizedBox(height: verticalSpacing),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _startDateController,
                                  decoration: const InputDecoration(
                                    labelText: 'Start Date',
                                    border: OutlineInputBorder(),
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2025),
                                    );
                                    if (picked != null) {
                                      setState(() {
                                        _startDateController.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(picked);
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
                                  controller: _endDateController,
                                  decoration: const InputDecoration(
                                    labelText: 'End Date',
                                    border: OutlineInputBorder(),
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2025),
                                    );
                                    if (picked != null) {
                                      setState(() {
                                        _endDateController.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(picked);
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
                          SizedBox(height: verticalSpacing),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Reason',
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(fontSize: inputFontSize),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a reason';
                              }
                              return null;
                            },
                            onSaved: (value) => _reason = value!,
                          ),
                          SizedBox(height: verticalSpacing),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Hours',
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(fontSize: inputFontSize),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the number of hours';
                              }
                              return null;
                            },
                            onSaved: (value) => _hours = value!,
                          ),
                          SizedBox(height: verticalSpacing),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0A65FC),
                              minimumSize: Size(double.infinity, buttonHeight),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                print('Overtime Request Created');
                              }
                            },
                            child: Text(
                              'Create Overtime Request',
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
            ),
          ],
        ),
      ),
    );
  }
}
