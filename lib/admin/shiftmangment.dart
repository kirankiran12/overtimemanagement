import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ManageShiftsScreen extends StatefulWidget {
  const ManageShiftsScreen({super.key});

  @override
  _ManageShiftsScreenState createState() => _ManageShiftsScreenState();
}

class _ManageShiftsScreenState extends State<ManageShiftsScreen> {
  List<Map<String, String>> shifts = [
    {'date': '2024-12-20', 'shiftTime': '08:00 AM', 'assignedTo': 'Ali'},
    {'date': '2024-12-21', 'shiftTime': '04:00 PM', 'assignedTo': 'Ahmad'},
    {'date': '2024-12-22', 'shiftTime': '10:00 PM', 'assignedTo': 'Umar'},
  ];

  void addShift() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddShiftScreen()),
    ).then((newShift) {
      if (newShift != null) {
        setState(() {
          shifts.add(newShift);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Color(0xFF0A65FC),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
                topRight: Radius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                'Manage Shifts',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: shifts.length,
              itemBuilder: (context, index) {
                final shift = shifts[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF0A65FC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      'Shift: ${shift['shiftTime']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Date: ${shift['date']}, Assigned to: ${shift['assignedTo']}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF0A65FC),
        foregroundColor: Colors.white,
        onPressed: addShift,
        tooltip: 'Add Shift',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddShiftScreen extends StatefulWidget {
  @override
  _AddShiftScreenState createState() => _AddShiftScreenState();
}

class _AddShiftScreenState extends State<AddShiftScreen> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController assignedToController = TextEditingController();
  TimeOfDay? selectedTime;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color(0xFF0A65FC),
            hintColor: Color(0xFF0A65FC),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: ColorScheme.light(primary: Color(0xFF0A65FC)),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFF0A65FC)),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFF0A65FC),
              onPrimary: Colors.white,
              surface: Color(0xFF0A65FC),
              onSurface: Colors.white,
            ),
            timePickerTheme: TimePickerThemeData(
              dialBackgroundColor: Color(0xFF0049C1),
              hourMinuteTextColor: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  void _submitShift() {
    if (dateController.text.isEmpty ||
        assignedToController.text.isEmpty ||
        selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields!'),
        ),
      );
      return;
    }

    Navigator.pop(context, {
      'date': dateController.text,
      'shiftTime': selectedTime!.format(context),
      'assignedTo': assignedToController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A65FC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Add Shift',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 70),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    TextField(
                      controller: dateController,
                      readOnly: true,
                      onTap: () => _pickDate(context),
                      decoration: InputDecoration(
                        hintText: 'Date (YYYY-MM-DD)',
                        hintStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color(0xFF0A65FC),
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _pickTime(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF0A65FC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          selectedTime == null
                              ? 'Select Shift Time'
                              : 'Shift Time: ${selectedTime!.format(context)}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: assignedToController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Assigned To',
                        hintStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color(0xFF0A65FC),
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0A65FC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _submitShift,
                      child: const Text(
                        'Save Shift',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
