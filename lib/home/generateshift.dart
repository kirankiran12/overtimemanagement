import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ShiftScreen1 extends StatefulWidget {
  const ShiftScreen1({super.key});

  @override
  State<ShiftScreen1> createState() => _ShiftScreen1State();
}

class _ShiftScreen1State extends State<ShiftScreen1> {
  List<Map<String, String>> schedule = [];
  String? filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A65FC),
        title: const Text(
          'Shift Schedule Generator',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0A65FC),
              ),
              onPressed: () async {
                try {
                  String path = await generateShiftDocument();
                  setState(() {
                    filePath = path;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Document saved at:\n$path'),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to generate document: $e'),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: const Text(
                'Generate Shift Document',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            if (schedule.isNotEmpty) ...[
              const Text(
                'Generated Schedule:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: schedule.length,
                  itemBuilder: (context, index) {
                    final entry = schedule[index];
                    return ListTile(
                      title: Text('Date: ${entry['date']}'),
                      subtitle: Text('Shift: ${entry['shift']}'),
                    );
                  },
                ),
              ),
            ],
            if (filePath != null) ...[
              const SizedBox(height: 20),
              const Text(
                'File Path:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                filePath!,
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<String> generateShiftDocument() async {
    DateTime startDate = DateTime(2024, 12, 13);
    int days = 14;
    List<Map<String, String>> newSchedule =
        generateShiftPattern(startDate, days);

    setState(() {
      schedule = newSchedule;
    });

    final StringBuffer docContent = StringBuffer();
    docContent.writeln('Staff Shift Schedule\n');
    for (var entry in newSchedule) {
      docContent.writeln('Date: ${entry['date']}');
      docContent.writeln('Shift: ${entry['shift']}\n');
    }

    final tempDir = await getApplicationDocumentsDirectory();
    final path = '${tempDir.path}/Staff_Shift_Schedule.docx';
    final file = File(path);

    try {
      await file.writeAsString(docContent.toString());
      print('Word document saved at $path');
      return path;
    } catch (e) {
      throw 'Error writing file: $e';
    }
  }

  List<Map<String, String>> generateShiftPattern(DateTime startDate, int days) {
    List<Map<String, String>> shiftSchedule = [];
    final shiftCycle = ['On', 'On', 'Off', 'Off', 'Off', 'Off'];

    for (int i = 0; i < days; i++) {
      final date = startDate.add(Duration(days: i));
      final shift = shiftCycle[i % shiftCycle.length];
      shiftSchedule.add({
        'date':
            '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
        'shift': shift,
      });
    }

    return shiftSchedule;
  }
}
