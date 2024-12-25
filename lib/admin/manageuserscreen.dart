import 'package:flutter/material.dart';

class ManageUsersScreen extends StatefulWidget {
  const ManageUsersScreen({super.key});

  @override
  _ManageUsersScreenState createState() => _ManageUsersScreenState();
}

class _ManageUsersScreenState extends State<ManageUsersScreen> {
  final List<Map<String, dynamic>> users = [
    {
      'id': 1,
      'name': 'Sir waseem',
      'email': 'code@example.com',
      'role': 'Admin'
    },
    // {
    //   'id': 2,
    //   'name': 'Sir Usama',
    //   'email': 'thinker@example.com',
    //   'role': 'manager'
    // },
     {
      'id': 3,
      'name': 'Sir Usama',
      'email': 'overtime@example.com',
      'role': 'Employee'
    },
    //  {
    //   'id': 2,
    //   'name': 'Sir Usama',
    //   'email': 'thinker@example.com',
    //   'role': 'manager'
    // },
    {
      'id': 4,
      'name': 'Ali',
      'email': 'manageent@example.com',
      'role': 'Employee'
    },
  ];

  void editUser(Map<String, dynamic> user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditUserScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: Color(0xFF0A65FC),
            ),
            child: Column(children: [
              SizedBox(height: 100),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color(0xFF0A65FC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  'Manage user ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            return Container(
                                margin: EdgeInsets.symmetric(vertical: 8.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFF0A65FC),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  title: Text(user['name']!,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(user['email']!,
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF0A65FC)),
                                    onPressed: () => editUser(user),
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ));
                          },
                        ),
                      )))
            ])));
  }
}

class EditUserScreen extends StatefulWidget {
  final Map<String, dynamic> user;

  EditUserScreen({required this.user});

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late String role;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user['name']);
    emailController = TextEditingController(text: widget.user['email']);
    role = widget.user['role'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF0A65FC),
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF0A65FC),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Text(
                'Edit User',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Color(0xFF0A65FC)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xFF0A65FC)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Color(0xFF0A65FC)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xFF0A65FC)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      DropdownButton<String>(
                        value: role,
                        onChanged: (newValue) {
                          setState(() {
                            role = newValue!;
                          });
                        },
                        items: ['Admin', 'Manager', 'Employee']
                            .map((role) => DropdownMenuItem(
                                  value: role,
                                  child: Text(role,
                                      style: TextStyle(
                                        color: Color(0xFF0A65FC),
                                      )),
                                ))
                            .toList(),
                        dropdownColor: Colors.white,
                        style: TextStyle(
                            color: Color(0xFF0A65FC),
                            fontWeight: FontWeight.bold),
                        iconEnabledColor: Colors.black,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0A65FC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          print('User Updated: ${nameController.text}, $role');
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
