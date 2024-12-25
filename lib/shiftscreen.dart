// import 'package:flutter/material.dart';

// class ShiftsScreen extends StatefulWidget {
//   const ShiftsScreen({super.key});

//   @override
//   _ShiftsScreenState createState() => _ShiftsScreenState();
// }

// class _ShiftsScreenState extends State<ShiftsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Container(
//         color: Color(0xFF0A65FC),
//         child: Column(
//           children: [
//             SizedBox(height: height * 0.1),
//             Text(
//               'Shifts',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: width * 0.08,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: height * 0.05),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     SizedBox(height: height * 0.03),
//                     Text(
//                       'Shifts List',
//                       style: TextStyle(
//                         fontSize: width * 0.06,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: height * 0.03),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: 10,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             contentPadding:
//                                 EdgeInsets.symmetric(horizontal: width * 0.05),
//                             title: Text(
//                               'Shift $index',
//                               style: TextStyle(
//                                 fontSize: width * 0.05,
//                               ),
//                             ),
//                             subtitle: Text(
//                               'Date: 2024-12-13',
//                               style: TextStyle(
//                                 fontSize: width * 0.04,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
