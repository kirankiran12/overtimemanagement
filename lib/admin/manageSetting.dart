import 'package:flutter/material.dart';

class ManageSettingScreen extends StatefulWidget {
  const ManageSettingScreen({super.key});

  @override
  _ManageSettingScreenState createState() => _ManageSettingScreenState();
}

class _ManageSettingScreenState extends State<ManageSettingScreen> {
  bool _isDarkMode = false;
  bool _isNotificationEnabled = true;
  bool _isLocationEnabled = false;
  String _selectedLanguage = 'English';
  String _selectedTimeZone = 'UTC-5';

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });

    print('Language changed to $language');
  }

  void _changeTimeZone(String timeZone) {
    setState(() {
      _selectedTimeZone = timeZone;
    });

    print('Time zone changed to $timeZone');
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: const Color(0xFF0A65FC),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Manage Settings',
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
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
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text('Dark Mode'),
                        trailing: Switch(
                          value: _isDarkMode,
                          onChanged: (value) {
                            setState(() {
                              _isDarkMode = value;
                            });
                            print(
                                'Dark mode: ${_isDarkMode ? 'Enabled' : 'Disabled'}');
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Notifications'),
                        trailing: Switch(
                          value: _isNotificationEnabled,
                          onChanged: (value) {
                            setState(() {
                              _isNotificationEnabled = value;
                            });
                            print(
                                'Notifications: ${_isNotificationEnabled ? 'Enabled' : 'Disabled'}');
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Location Services'),
                        trailing: Switch(
                          value: _isLocationEnabled,
                          onChanged: (value) {
                            setState(() {
                              _isLocationEnabled = value;
                            });
                            print(
                                'Location services: ${_isLocationEnabled ? 'Enabled' : 'Disabled'}');
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Language'),
                        trailing: DropdownButton<String>(
                          value: _selectedLanguage,
                          onChanged: (value) {
                            if (value != null) _changeLanguage(value);
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'English',
                              child: Text('English'),
                            ),
                            DropdownMenuItem(
                              value: 'Spanish',
                              child: Text('Spanish'),
                            ),
                            DropdownMenuItem(
                              value: 'French',
                              child: Text('French'),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: const Text('Time Zone'),
                        trailing: DropdownButton<String>(
                          value: _selectedTimeZone,
                          onChanged: (value) {
                            if (value != null) _changeTimeZone(value);
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'UTC-5',
                              child: Text('UTC-5'),
                            ),
                            DropdownMenuItem(
                              value: 'UTC+5',
                              child: Text('UTC+5'),
                            ),
                            DropdownMenuItem(
                              value: 'UTC-8',
                              child: Text('UTC-8'),
                            ),
                          ],
                        ),
                      ),
                    ],
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
