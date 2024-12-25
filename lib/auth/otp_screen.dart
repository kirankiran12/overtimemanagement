import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:overtime_managment/Auth/new_password_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Color(0xFF0A65FC),
      body: Center(
        child: SingleChildScrollView(
          
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Center(
                  child: Card(
                    color:     Color(0xFF0A65FC),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'OTP Verification',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Please enter the 4-digit OTP sent to your email.',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          PinCodeTextField(
                            controller: otpController,
                            highlight: true,
                            highlightColor: Colors.white,
                            defaultBorderColor: Colors.white,
                            hasTextBorderColor: Colors.black,
                            maxLength: 4,
                            hasError: false,
                            pinBoxHeight: 40, 
                            pinBoxWidth: 30, 
                            wrapAlignment:
                                WrapAlignment.center, 
                            pinTextStyle: const TextStyle(
                              fontSize: 16.0,
                            ),
                            onTextChanged: (value) {
                              if (kDebugMode) {
                                print("Current OTP: $value");
                              }
                            },
                            onDone: (otp) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'OTP Verified: $otp',
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'OTP Entered: ${otpController.text}'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                               backgroundColor:  Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Verify OTP",
                              style:
                                  TextStyle(fontSize: 15, color: Color(0xFF0A65FC)),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Newpassword(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              backgroundColor:  Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Create new password',
                              style:
                                  TextStyle(fontSize: 15, color: Color(0xFF0A65FC)),
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
      ),
    );
  }
}
